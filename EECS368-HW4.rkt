#lang racket
;;;-------------------------------------------------------------------------------------
;;;-------------------------------------------------------------------------------------
;;; ****************************** - 2 - ***********************************************

;;;-------------------------------------------------------------------------------------
;;; Exercise 4.55
;;; *** a.
;;; (supervisor ?x (Bitdiddle Ben))
;;;
;;; *** b.
;;; (job ?x (accounting . ?type))
;;;
;;; *** c.
;;; (address ?x (Slumerville . ?address))
;;;
;;;-------------------------------------------------------------------------------------

;;;-------------------------------------------------------------------------------------
;;; Exercise 4.56
;;; *** a.
;;; (and (supervisor ?x (Bitdiddle Ben))
;;;      (address ?x ?address))
;;;
;;; *** b.
;;; (and (salary ?name ?amount)
;;;      (salary (Bitdiddle Ben) ?BenSalary)
;;;      (lisp-value < ?amount ?BenSalary))
;;;
;;; *** c.
;;; (and (supervisor ?x ?supervisor)
;;;      (job ?supervisor ?job)
;;;      (not (job ?supervisor (computer . ?type))))
;;;
;;;-------------------------------------------------------------------------------------

;;;-------------------------------------------------------------------------------------
;;; Exercise 4.57
;;;-------------------------------------------------------------------------------------
;;; Rule for Excercise 5.7
;;; (rule (can-replace ?person1 ?person2)
;;;       (and (or (and (job ?person1 ?job1)
;;;                     (job ?person2 ?job1))
;;;                (and (job ?person1 ?job1)
;;;                     (job ?person2 ?job2)
;;;                     (can-do-job ?job1 ?job2)))
;;;            (not (same ?person1 ?person2))))
;;;-------------------------------------------------------------------------------------

;;; *** a.
;;; (can-replace ?x (Fect Cy D))
;;;
;;; *** b.
;;; (and (salary ?person1 ?salary1)
;;;      (salary ?person2 ?salary2)
;;;      (lisp-value < ?salary1 ?salary2)
;;;      (can-replace ?person1 ?person2))
;;;
;;;-------------------------------------------------------------------------------------
;;;-------------------------------------------------------------------------------------
;;;-------------------------------------------------------------------------------------

;;;-------------------------------------------------------------------------------------
;;;-------------------------------------------------------------------------------------
;;; ****************************** - 3 - ***********************************************

;;; # a.
;;; (assert!(rule(append-to-form(?u . ?v)?y(?u . ?z))(append-to-form ?v ?y ?z)))
;;; (assert!(rule (append-to-form () ?y ?y)))
;;; (append-to-form(a b)(c d)?z)
;;; (append-to-form (a b) ?y (a b c d))
;;; (append-to-form ?x ?y (a b c d))
;;;
;;;-------------------------------------------------------------------------------------

;;; # b.
;;; Exercise 4.61
;;;
;;; (assert!(rule (?x next-to ?y in (?v . ?z))
;;;        (?x next-to ?y in ?z)))
;;; (assert!(rule (?x next-to ?y in (?x ?y . ?u))))
;;; (?x next-to ?y in (1 (2 3) 4))
;;; (?x next-to 1 in (2 1 3 1))
;;;-------------------------------------------------------------------------------------

;;; # c.
;;;
;;; (assert!(rule(tree->list(?x . ?y)?v ?a)
;;;              (and(tree->list ?x ?v ?u)(tree->list ?y ?u ?a )) ))
;;; (assert!(rule(tree->list ?s ?v ?a)(and(Ap(?s)?v ?a)(lisp-value symbol? ?s))))
;;; (assert!(rule(tree->list ?s ?v ?a)(and(Ap(?s)?v ?a)(lisp-value number? ?s))))
;;; (assert!(rule(tree->list ()?v ?a) (Ap ()?v ?a )  ))
;;; (assert!(rule(tree->list ?t ?v) (tree->list ?t ?v ()) ))
;;; (assert!(rule(Ap(?x1)(?x1 . ?1)?1)))
;;; (assert!(rule(Ap()?1 ?1)))
;;;
;;; (tree->list (((a . b).(c . d)) . (d .(e . f))) ?z) 
;;; (tree->list (((a . 2).(c . 4)) . (4 .(e . 6))) ?z)
;;;
;;;-------------------------------------------------------------------------------------

;;; # d.
;;;
;;; (tree->list ?t())
;;; (tree->list ?t(a))
;;; (tree->list ?t(a b))
;;;
;;;-------------------------------------------------------------------------------------

;;;-------------------------------------------------------------------------------------
;;;-------------------------------------------------------------------------------------
;;; ****************************** - 4 - ***********************************************

;;; # a.
;;;
;;; (and(supervisor ?x ?y)(not(job ?x (computer programmer))) )
;;;
;;; (and(not(job ?x (computer programmer)))(supervisor ?x ?y) )
;;;
;;;-------------------------------------------------------------------------------------

;;; # b.
;;; Exercise 4.65
;;; 
;;; (wheel ?who)
;;; 
;;;-------------------------------------------------------------------------------------

;;; # c.
;;; Exercise 4.64
;;; 
;;; (outranked-by (Bitdiddle Ben) ?who)
;;;
;;; (assert!(rule(***outranked-by ?staff-person ?boss)
;;;              (or(supervisor ?staff-person ?boss)
;;;                 (and(***outranked-by ?middle-manager ?boss)
;;;                     (supervisor ?staff-person ?middle-manager)))) )
;;;
;;; (***outranked-by (Bitdiddle Ben) ?who)
;;; 
;;;-------------------------------------------------------------------------------------

;;;-------------------------------------------------------------------------------------
;;;-------------------------------------------------------------------------------------
;;; ****************************** - 5 - ***********************************************

;;; ;;; grammar
(rule (sent4 ?x ?t2 (sent ?a ?b ?c ?d ?e ?f ?g ?h)) (and (sent ?x ?y ?a)
                                                         (or (sent-conj ?y ?z ?b) (semicolon ?y ?z ?b))
                                                         (sent ?z ?u ?c)
                                                         (or (sent-conj ?u ?v ?d) (semicolon ?u ?v ?d))
                                                         (sent ?v ?w ?e)
                                                         (or (sent-conj ?w ?t ?f) (semicolon ?w ?t ?f))
                                                         (sent ?t ?t1 ?g)
                                                         (period ?t1 ?t2 ?h)))
(rule (sent ?x ?z (sent ?a ?b)) (or (and (N+V ?x ?y ?a) (adj ?y ?z ?b))
                                    (and (np ?x ?y ?a) (vg ?y ?z ?b))
                                    (and (np ?x ?y ?a) (verb ?y ?z ?b))))
(rule (sent ?x ?u (sent ?a ?b ?c)) (and (preadj ?x ?y ?a) (inverb ?y ?z ?b) (np ?z ?u ?c)))
(rule (preadj ?x ?z (preadj ?a ?b)) (and (adv ?x ?y ?a) (adj ?y ?z ?b)))
(rule (sent-conj ?x ?z (sent-conj ?a ?b)) (and (comma ?x ?y ?a) (conj ?y ?z ?b)))                                
(rule (np ?x ?z (np ?a ?b)) (and (art ?x ?y ?a) (ng ?y ?z ?b)))
(rule (ng ?x ?z (ng ?a ?b)) (and (adj ?x ?y ?a) (noun ?y ?z ?b)))
(rule (ng ?x ?y (ng ?a)) (noun ?x ?y ?a))
(rule (vg ?x ?z (vg ?a ?b)) (and (aux ?x ?y ?a) (vc ?y ?z ?b)))
(rule (vg ?x ?u (vg ?a ?b ?c)) (and (aux ?x ?y ?a) (vc ?y ?z ?b) (pp ?z ?u ?c)))
(rule (vc ?x ?u (vc ?a ?b ?c)) (and (verb ?x ?y ?a) (conj ?y ?z ?b) (or (verb ?z ?u ?c) (verb+PP ?z ?u ?c))))
(rule (verb+PP ?x ?z (verb+PP ?a ?b)) (and (verb ?x ?y ?a) (pp ?y ?z ?b)))
(rule (pp ?x ?z (pp ?a ?b)) (and (prep ?x ?y ?a) (np ?y ?z ?b)))

(rule (art (the . ?x) ?x (art the)))
(rule (N+V (Twas . ?x) ?x (N+V Twas)))
(rule (adj (brillig . ?x) ?x (adj brillig)))
(rule (adj (slithy . ?x) ?x (adj slithy)))
(rule (adj (mimsy . ?x) ?x (adj mimsy)))
(rule (adj (mome . ?x) ?x (adj mome)))
(rule (adv (All . ?x) ?x (adv All)))
(rule (noun (toves . ?x) ?x (noun toves)))
(rule (noun (wabe . ?x) ?x (noun wabe)))
(rule (noun (borogoves . ?x) ?x (noun borogoves)))
(rule (noun (raths . ?x) ?x (noun raths)))
(rule (verb (gyre . ?x) ?x (verb gyre)))
(rule (verb (gimble . ?x) ?x (verb gimble)))
(rule (verb (outgrabe . ?x) ?x (verb outgrabe)))
(rule (inverb (were . ?x) ?x (inverb were)))
(rule (comma (<comma> . ?x) ?x (comma <comma>)))
(rule (semicolon (<semicolon> . ?x) ?x (semicolon <semicolon>)))
(rule (period (<period> . ?x) ?x (period <period>)))
(rule (conj (And . ?x) ?x (conj And)))
(rule (conj (and . ?x) ?x (conj and)))
(rule (aux (Did . ?x) ?x (aux Did)))
(rule (prep (in . ?x) ?x (prep in)))

;;;sent4
(sent4 (Twas brillig <comma> and the slithy toves
             Did gyre and gimble in the wabe <semicolon>
             All mimsy were the borogoves <comma>
             And the mome raths outgrabe <period>)
       ()
       ?answer)
;;;-------------------------------------------------------------------------------------
