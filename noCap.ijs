-*- mode: org -*-

#+begin_src j
  ([: ({:-{.) [: I. 1 p: [) 4 2 9 4 3
  Indices =. 3 : 'I. y'
  IsPrime =. 3 : '1 p: y'
  (({:-{.) & Indices & IsPrime) 4 2 9 4 3
  (({:-{.) & I. & (1 p: [)) 4 2 9 4 3
#+end_src

#+RESULTS:
: 3

#+begin_src j
  mpd =. [: ({:-{.) [: I. 1 p: [
  mpd 4 2 9 4 3
#+end_src

#+RESULTS:
: 3
