(define (equal? l1 l2)
(if (pair? l1) (if (eq? (car l1) (car l2)) #t #f) (if (eq? l1 l2) #t  #f))
)

(define (not l)
(if l #f #t)

)

(define (cadr l)
(car (cdr l))
)

(define (cddr l)
(cdr (cdr l))
)

(define (cdar l)
(cdr (car l))
)


(define (caar l)
(car (car l))
)

(define (caaar l)
(car (car (car l)))
)

(define (caadr l)
(car (car (cdr l)))
)

(define (cadar l)
(car (cdr (car l)))
)


(define (caddr l)
(car (cdr (cdr l)))
)

(define (and l1 l2)
(if l1 l2 #f
))

(define (or l1 l2)
(if l1 #t l2
))


(define (map f l)
	(cond ((null? l) '())
		(else (cons (f (car l)) (map f (cdr l))))))

(define (cadddr l)
(car (cdr (cdr (cdr l))))
)

(define (cdddr l)
(cdr (cdr (cdr l)))
)

(define (assoc var env)
	(if (equal? var (caar env)) (car env) (assoc var (cdr env))))


(define (append l1 l2)
    (cond ((null? l1) l2)
    	(else (cons (car l1) (append (cdr l1) l2))))
	)




