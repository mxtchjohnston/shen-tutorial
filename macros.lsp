\*Shen macros allow the user to program the Shen reader. Programs are read into the reader as list structures, just as in Lisp. By manipulating these list structures, we can program in our own syntax. A Shen macro has the same syntax as a Shen function except that

defmacro is used instead of define.
The macro must define a 1-place function.
The default rule X -> X is inserted by Shen when compiling the macro.
All macros are applied to a fixpoint to every token read by the reader. i.e. let m1,...mn be the list of macros existing in the system and let f be the composition of m1,...mn. Then every token t read by the reader is transformed to fix(f,t) where fix is defined as

fix(f,x) = x if f(x) = x

fix(f,x) = fix(f, f(x)) if ~(f(x) = x)

For example, suppose we have created a 2-place function log and wish to create a version of log that takes the second argument as optional. If the optional argument is omitted, we want the log function to work to the base 10.

To create the illusion of polyadicity, we use our two place log function and write a macro to insert the second argument if it is missing.
 *\




\\Note a macro has to be read in and compiled before it is used. It cannot be used to macroexpand expressions inside the file within which it is is defined.
