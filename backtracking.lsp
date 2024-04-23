\*
Backtracking is invoked in a Shen function f by using <- in place of ->. The effect is that the expression after the <- is returned only if it does not evaluate to the failure object (fail). If (fail) is returned; then the next rule in f is applied.
 *\

(define foo
	X <- (if (integer? X) 0 (fail))
	X -> X)

(foo 5)
(foo a)
