(error "This is an error")

(trap-error (error "this is an error") (/. E "I trapped the error"))

(trap-error (error "this is an error message, followed by a new line~%") (/. E (error-to-string E)))
