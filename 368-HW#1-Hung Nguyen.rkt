#lang racket
(require racket/trace)	

(define (enumerate-interval l h)
  (if (> l h) '()
      (cons l (enumerate-interval (+ l 1) h))))

(define (iperm l a)
  (if (null? l) (list a)
      (append-map (lambda(p) (iperm (remove p l) (cons p a))) l)))

(define (diagonal? col a)
  (define (check? pos) 
    (cond ((null? a) #f)
          ((= pos (length a)) #f)
          ((equal? (abs (- col (list-ref a pos))) (+ pos 1)) #t)
          (else (check? (+ pos 1)))))
  (check? 0))

(define (iqueens l a)
  (if (null? l) (list a)
      (append-map (lambda(p) (if (diagonal? p a) '() 
                                 (iqueens (remove p l) (cons p a)))) 
                  l)))

(define (q n)
  (if (= 0 n) '() (iqueens (enumerate-interval 1 n) '())))

(define (test n)
  (map (lambda (i) (cons i (cons (length (q i)) null))) 
       (enumerate-interval 0 n)))

(test 12)