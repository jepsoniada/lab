-*- mode: org -*-

#+begin_src js
  const range = a => [...Array(a).fill().keys()]
  const test = range(10)
  const stest = test.splice(2)
  console.log(`${test} : ${stest}`)
#+end_src

#+RESULTS:
: 0,1 : 2,3,4,5,6,7,8,9
: undefined
