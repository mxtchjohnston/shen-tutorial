(define tuple->list
	(@p X Y) -> [X | (tuple->list Y)]
	X -> [X])

(tuple->list (@p 1 2 3))
