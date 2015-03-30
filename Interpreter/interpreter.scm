(define (repl)   
  (display "--> ") 
  (let ((exp (read)))
    (cond ((equal? exp '(exit))     
	   'done)
	  (else  (display (top-eval exp))
		 (newline)
		 (repl))
	  )))


(define (my-apply f l)
	 (cond ((equal? (car f) 'primitive-function)
     (apply (cadr f) l))
     (else (handle-call (cons  f l)))
))


(define (my-load filename)       
  (load-repl (open-input-file filename)))


(define (load-repl port)
  (let ((exp (read port)))
    (cond ((eof-object? exp) 'done)
	  (else (let ((res (top-eval exp)))
		  (display res)
		  (load-repl port)))
	  )))



(define (insert! val L)
  (set-cdr! L (cons (car L) (cdr L)))
  (set-car! L val)
  )


(define (top-eval exp)
  (cond ((not (pair? exp)) (my-eval exp *global-env*))
	((eq? (car exp) 'define)
	  (cond ((not (pair? (cadr exp)))
	 (insert! (list (cadr exp) (my-eval (caddr exp) *global-env*)) *global-env*) (cadr exp))
	 (else (handle-define (car (car (cdr exp))) (cdr (car (cdr exp)))   (cdr (cdr exp))  )))) 
	(else (my-eval exp *global-env*))
	))


(define (handle-define fun-name args body-exp)
(insert! (list fun-name  (my-eval (cons 'lambda (cons args body-exp)) *global-env*))  *global-env* )
)	


(define (lookup var env)
  (let ((item (assoc var env))) 
    (cond ((not item) (display "Error: Undefined Symbol ")
		      (display var) (newline))
	  (else (cadr item))
	  )))



(define (handle-if test then-exp else-exp env)
  (if (my-eval test env)
      (my-eval then-exp env)
      (my-eval else-exp env)))



(define (my-eval exp env)
  (cond
   ((symbol? exp) (lookup exp env))
   ((not (pair? exp)) exp)
   ((eq? (car exp) 'quote) (cadr exp))
   ((eq? (car exp) 'cond)   (handle-cond (cdr exp) env))
   ((eq? (car exp) 'let)   (handle-let (cadr exp) (cddr exp) env ))
   ((eq? (car exp) 'let*)   (handle-let* (cadr exp) (cddr exp) env ))
   ((eq? (car exp) 'letrec)   (handle-letrec (cadr exp) (cddr exp) env (cdr (list '())) (cadr exp)))
   ((eq? (car exp) 'if)
    (handle-if (cadr exp) (caddr exp) (cadddr exp) env))
   ((eq? (car exp) 'longest)
    (handle-longest (cdr exp) env))
   ((eq? (car exp) 'lambda)
    (list 'closure exp env))
   ((eq? (car exp) 'letrec)
    (handle-letrec (cadr exp) (cddr exp) env))  ;; see explanation below
   (else
    (handle-call (map (lambda (sub-exp) (my-eval sub-exp env)) exp)))
   ))




(define (handle-letrec dec-exp body-exp env loc save-dec-exp)	
(cond ((not (null? dec-exp)) (handle-letrec (cdr dec-exp) body-exp env (cons (list (caar dec-exp) '(*uninitialized*)) loc) save-dec-exp))
(else (let ((*new-env* (append loc env))) (cond ((null? save-dec-exp) (com-my-eval body-exp (append loc env))) 
(else (set-cdr! 
(assoc (caar save-dec-exp) *new-env*) (list (my-eval (cadar save-dec-exp) *new-env*))) 
(handle-letrec dec-exp body-exp env loc (cdr save-dec-exp)) )))))) 


(define (handle-let defs body env)
  (handle-block body (append (map (lambda (def) (list (car def) (my-eval (cadr def) env))) defs) env))
  )


(define (handle-let* dec-exp body-exp env)	
(cond ((not (null? dec-exp)) (handle-let* (cdr dec-exp) body-exp (cons (list (caar dec-exp) (my-eval (cadar dec-exp) env)) env)))
	 (else (com-my-eval body-exp env))))


(define (com-my-eval body-exp *new-env*)
(cond ((null? (cdr body-exp)) (my-eval (car body-exp) *new-env*))
	   (else (my-eval (car body-exp) *new-env*) (com-my-eval (cdr body-exp) *new-env*))))


(define (len l)
   (if (null? l) 0 (+ 1 (len (cdr l)))))

(define (evalexp l index count)
	(if (= count index) (top-eval (cadar l)) (evalexp (cdr l) index (+ 1 count)))
)

(define (findmax l count m maxl)
  (cond ((null? l) m) 
        (else (if (> (len (top-eval (caar l))) maxl) (findmax (cdr l) (+ 1 count) count (len (top-eval (caar l)))) (findmax (cdr l) (+ 1 count) m maxl)))))


(define (handle-longest l env)
  (evalexp l (findmax l 1 1 0) 1)
)




(define (handle-cond exp env)
	(if (not (eq? (caar exp) 'else)) (if (my-eval (caar exp) env) (handle-block (cdar exp) env) (handle-cond (cdr exp) env)) (handle-block (cdar exp) env)))  



(define (bind formals actuals)
  (cond ((null? formals) '())
	(else (cons (list (car formals) (car actuals))
		    (bind (cdr formals) (cdr actuals))))
	))

(define (handle-block block env)
  (cond ((null? block) (display "Error: Can't have empty block or body"))
	((null? (cdr block)) (my-eval (car block) env))
	(else (my-eval (car block) env)
	      (handle-block (cdr block) env))
	))
    


(define (handle-call evald-exps)
  (let ((fn (car evald-exps))
	(args (cdr evald-exps)))
   (cond
    ((eq? (car fn) 'closure)
     (let ((formals (cadr (cadr fn)))
	   (body (cddr (cadr fn)))
	   (env (caddr fn)))
       (handle-block body (append (bind formals args) env))))
    ((eq? (car fn) 'primitive-function)
     (apply (cadr fn) args))
    (else (display "Error: Calling non-function"))
    )))




(define *global-env*
  (list (list 'car (list 'primitive-function car))
	(list 'cdr (list 'primitive-function cdr))
	(list 'set-car! (list 'primitive-function set-car!))
	(list 'set-cdr! (list 'primitive-function set-cdr!))
	(list 'cons (list 'primitive-function cons))
	(list 'list (list 'primitive-function list))
	(list '+ (list 'primitive-function +))
	(list 'apply (list 'primitive-function my-apply))
	(list '- (list 'primitive-function -))
	(list '* (list 'primitive-function *))
	(list '= (list 'primitive-function =))
	(list '< (list 'primitive-function <))
	(list '> (list 'primitive-function >))
	(list 'newline (list 'primitive-function newline))
	(list '<= (list 'primitive-function  <=))
	(list '>= (list 'primitive-function >=))
	(list 'eq? (list 'primitive-function eq?))
	(list 'pair? (list 'primitive-function pair?))
	(list 'symbol? (list 'primitive-function symbol?))
	(list 'null? (list 'primitive-function null?))
	(list 'read (list 'primitive-function read))
	(list 'display (list 'primitive-function  display))
	(list 'open-input-file (list 'primitive-function open-input-file))
	(list 'close-input-port (list 'primitive-function close-input-port))
	(list 'eof-object? (list 'primitive-function eof-object?))
	(list 'load (list 'primitive-function my-load))  
	))













