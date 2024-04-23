(defprolog member
   X [X | _] <--;
   X [_ | Y] <-- (member X Y);)

(defprolog rev
       [] [] <--;
       [X | Y] Z <-- (rev Y W) (conc W [X] Z);)

(defprolog conc
  [] X X <--;
  [X | Y] Z [X | W] <-- (conc Y Z W);)

(prolog? (member 1 [1 2]))

(prolog? (member 0 [1 2]))

(prolog? (member X [1 2]))

(prolog? (member X [1 2]) (return X))

(prolog? (rev [1 2] X) (return X))


