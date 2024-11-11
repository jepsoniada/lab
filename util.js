-*- mode: Org -*-

* range

#+begin_src js
  const range = a => [...Object.keys(Array(a).fill())].map(Number)
  return range(0)
#+end_src

#+RESULTS:
