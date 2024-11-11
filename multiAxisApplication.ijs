-*- mode: org; org-confirm-babel-evaluate: nil -*-

#+begin_src j :results verbatim
  ((+/)`[:) @. 1 0 1 0 1 0 0 (3 3 3 3 $ 1)
#+end_src

#+RESULTS:
: 81

#+begin_src j :results verbatim
  (+/)^:(4) (3 3 3 3 $ 1)
#+end_src

#+RESULTS:
: 81

#+begin_src j :results verbatim
  a =: (3 3 $ < 1 (< 1 1)} 3 3 $ 0)
  verb =: (4 :'(1 0 _1) ((|."x&.>)"x) y')"0 _
  NB. verb =: +
  mxapl =: 1 : 'x u^:(# x) y'
  2 1 (verb mxapl) a
  _ _ _ {{ (+/"x) y }} mxapl 3 3 3 $ 1
#+end_src

#+RESULTS:
: 27
