\*
Consider the following grammar.

<sent> := <np> <vp>
<np> := <det> <n> | <name>
<det> := the | a
<n> := cat | dog
<name> := Bill | Ben
<vp> := <vtrans> <np>
<vtrans> := likes | chases

In Shen-YACC, this grammar would be represented as:
 *\

(defcc <sent>
  <np> <vp>;)

(defcc <np>
  <det> <n>;
  <name>;)

(defcc <n>
  cat; dog;)

(defcc <name>
  bill; ben;)

(defcc <vp>
 <vtrans> <np>;)

(defcc <vtrans>
   likes; chases;)

\*
If semantic actions (i.e instructions on how to process the input) are not included, Shen-YACC warns the user and inserts a default semantic action (semantic completion). This default action appends non-terminals and conses terminals to form an output. The spacing is left to the judgement of the programmer, but ;s separate rules. When one of these definitions (e.g. for <sent>) is entered to the top level, it is compiled into Common Lisp by YACC with the message warning; no semantics in <np> <vp>.

The compiler generated acts as a recogniser for sentences of the language characterised by this grammar. If it is not a sentence of the language, then an exception is returned. If the input to the compiler belongs to this language, the program behaves as an identity function. The compiler is invoked by the higher-order function compile, that receives the name of a YACC function and parses its second input by that function.
*\

(compile (fn <sent>) [the cat likes the dog])

(compile (fn <sent>)[the cat likes the canary])

(compile (fn <vp>) [chases the cat])

\*
Note that names of YACC functions should always be enclosed in angles. YACC is sensitive to left-recursion which will force an infinite regress. YACC code is not type checked, but the code can be tracked just like regular code. Lists to the right of := are constructed in YACC using [...] or cons or any of the conventional methods. Unlike Shen, the constructor | cannot be used in the syntax of an expansion (i.e. to the left of :=), though it can be used to the right (in a semantic action) to perform consing. However [...] can be used to the left of :=. Variables and wildcards are allowed to pattern match under Shen-YACC as in Shen and lists can be embedded in the input.

<bcs>, below, recognises the inputs belonging to [bm][cn]. Variables are uppercase as in Shen.
*\

defcc <bcs>
  <bs> <cs>;)

(defcc <bs>
  b <bs>;
  b;)

(defcc <cs>
  c <cs>;
  c;)

(compile (fn <bcs>)[b b b c c])


