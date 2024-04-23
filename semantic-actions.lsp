\*
Semantic actions are attached to grammar rules by following each rule by a :=. This YACC definition receives a list of as and changes them to bs.
*\

(defcc <as>
	a <as> := [b | <as>];
	a := [b];)

(compile (fn <as>) [a a a a])

\*
The first rule says that any input of the form a <as> is to be translated into an output consisting of b consed to the translation of <as>. The syntax of <as> requires that the input be a non-empty list composed of occurrences of a. So (compile (function <as>) [a a a]) gives [b b b]. The second rule is the base case.

As in Shen, round brackets signify function applications and square ones form lists. The following reformulation is an example:
 *\

(defcc <sent>
  <np> <vp> := (question <np> <vp>);)

(define question
  NP VP -> (append [(protect Is) it true that] NP VP [?]))

(compile (fn <sent>) [the cat likes the dog])

\*
<!> and <e> are both reserved non-terminals. <e> always succeeds consuming none of the input and under semantic completion returns the empty list. <!> always succeeds and consumes all of the input and under semantic completion returns that remaining input.
*\
