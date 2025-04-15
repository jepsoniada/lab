-*- mode: Org; eval: (progn (org-babel-do-load-languages 'org-babel-load-languages '((js . t)))) -*-

* range

#+begin_src js
  const range = a => [...Object.keys(Array(a).fill())].map(Number)
#+end_src

* tablefy

turns Array[Object] into easily parsable table like structure

| a | b | c |
|---+---+---|
| 1 |   |   |
|   | 1 |   |
|   |   | 1 |

#+begin_src js
  const tablefy = (obs) => {
      const keys = [...new Set(obs.map(Object.keys).flat())]
      return [keys
  	    , ...obs
  	    .map(a => keys.map(b => a[b]))
  	   ]
  }
  // return tablefy([{a: 1}, {b: 1}, {c: 1}])
#+end_src
