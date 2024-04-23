\\ ;; Learning Shen <https://shenlanguage.org/>

\\ intern converts a string to a symbol
(intern "chess")

\\ Strings 
\\  Begin and end with double quotes
\\  can be created from atoms with the str function
\\  a unit string has one character
\\  fast binary concatenation
(cn "foo" "bar")

\\ multiple concatenation
(@s "a" "b" "c")

\\ tail of string
(tlstr "abc")

\\ select character
(pos "hello world" 6)

\\ make~string is similar to format in other languages
\\  ~A: directive to insert argument at corresponding spot
(make~string "~A says, hello World" "Fred")

\\ ~S Directive inserts argument including quotes or brackets
(make~string "~S say, hello world~%" [Bill and Ben])

\\ ~R directive for rounded brackets

\\ ~% directive for new line

\\ Numbers

int, float, exponent

\\ Function Applications
\\ Prefix notation
\\ Partial applications are supported for nearly all functions
\\  applicative order and strict except for if, and, or, cases, freeze, lambda, /.
\\  associativity perserved

\\ Lists
[1 2 3]
(head [1 2 3])
(tail [1 2 3])

(cons 1 [2 3])

[1 2 | [3]]

\\ Tuples
(@p a b)

(fst (@p a b))
(snd (@p a b))
(tuple? (@p a b))

\\ Vectors
\*
'(vector n)' creates a (standard) vector with n elements numbered from 1 to n. For standard vectors the zeroth address holds an integer that gives the size of the vector. Certain special vectors called print vectors can be created that use this zeroth index for other purposes (see SD reference). The shortest standard vector is created by expression '(vector 0)' which creates a standard vector whose zeroth address contains the object zero. This called the empty vector and Shen permits the user to write <> as shorthand for the empty vector.

Vectors are printed out as <...> where ... are the contents of the vector.

'(<-vector v n)' accesses the nth (n >= 1) element of vector v. Note that this will raise an error if no object has been placed in the nth index.

The function limit accesses the 0th element of a vector v and gives the size of v.

Shen vectors are mutable. '(vector-> v n x)' destructively modifies v by placing x in the nth address of v.

A 2-dimensional array is simply a vector of vectors. The non-destructive operation '(@v x v)' creates a new vector v' whose tail is the same as v and whose head is x. @v is polyadic '(@v a b ... n v)' adds n elements in order to a vector V, copying it and creating a new vector.
 *\

(set *myvector* (@v 1 <>))
(limit (value *myvector*))
(set *myvector* (@v 0 (value *myvector*)))
(limit (value *myvector*))
(@v -1 (value *myvector*))
(limit (value *myvector*)) \\@v is non-destructive
(<-vector (value *myvector*) 2)
(vector-> (value *myvector*) 2 a)
(value *myvector*) \\ vector-> is destructive, the global is changed

\\ lambdas and let

\\ global assignments

(set dozen 12)
(value dozen)
(bound? dozen)


