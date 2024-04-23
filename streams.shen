(set *stream* (open "streams.shen" in))

(read-byte (value *stream*))
(read-byte (value *stream*))
(read-byte (value *stream*))
(read-byte (value *stream*))
(close (value *stream*))
