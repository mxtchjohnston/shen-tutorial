\*
Shen compiles into a miniature Lisp called 'Kλ'. It is possible to communicate directly to Kλ through the Lisp top level. Kλ is very much an orthodox Lisp in the manner of Scheme, except symbols are not quoted (as in Shen). There is no significance associated with uppercase letters because pattern-matching does not exist in Kλ.

*\

(defun rev (x)
        (if (empty? x) x
        (append (rev x) (cons (hd x) ()))))
(rev [1 2 3])
