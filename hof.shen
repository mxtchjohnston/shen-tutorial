(define foldl
	F Z [] -> Z
	F Z [X | Xs] -> (foldl F (F Z X) Xs))

(foldl (fn +) 0 [1 2 3])
\\ fn denotes that + should be treated as a function

(map (+ 1) [1 2 3 4])

(map (/. X (- X 1)) [1 2 3 4])

\\lazy evaluation

(define fact
	0 -> 1
	X -> (* X (fact (- X 1))))

(freeze (fact 8))
(thaw (freeze (fact 8)))

