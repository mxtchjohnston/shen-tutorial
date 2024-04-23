(define prefix?
	[] _ -> true
	[X | Y] [X | Z] -> (prefix? Y Z)
	_ _ -> false)

(prefix? [1 2 3] [1 2 3 4 5 6])

(prefix? [2 3] [3 4])
