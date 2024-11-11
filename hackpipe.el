-*- mode: org; org-confirm-babel-evaluate: nil -*-

* idea

replicate idea of pipe from js proposal for pipeline operator:
[[https://github.com/tc39/proposal-pipeline-operator/tree/6a2cd7e8347d76e74ae7b0f8b02c0d3dd7568ef4]]

** just pipe

#+begin_src emacs-lisp :results verbatim
  (defmacro |> (&rest funcs)
    (cl-loop for func in funcs
  	   for result = (list func '_pipe) then (list func result)
  	   finally return (list 'lambda '(_pipe) result)))
  (funcall (|> car car -) '((1)))
  (|> car car -)
#+end_src

#+RESULTS:
: #[(_pipe) ((- (car (car _pipe)))) nil]

** hackpipe

#+begin_src emacs-lisp :results verbatim
  (defmacro |> (&rest funcs)
    (cl-loop for func in (reverse funcs)
  	   
  	   if (and (listp func)
  		   (length> func 0))
  	   for result = `(let ((% ,func)) %)
  	   then `(let ((% ,func)) ,result)
  	   
  	   else if (null func)
  	   return (error "empty function")
  	   
  	   else if (symbolp func)
  	   for result = `(let ((% (,func %))) %)
  	   then `(let ((% (,func %))) ,result)
  	   
  	   else
  	   return (error "not implemented")
  	   
  	   finally return `(lambda (%) ,result)))

  (funcall (|> (car %)
  	     (car %)
  	     (+ % %))
  	 (list (list 1)))
#+end_src

#+RESULTS:
: 2

