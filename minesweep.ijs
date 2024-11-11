-*- mode: org; org-confirm-babel-evaluate: nil -*-

* genfield

generates location of mines and numbers surrounding them

#+name: genfield
#+begin_src j
  genfield =: {{
    mines =. 1 > ? y $ 6	NB. random
    NB. mines =. 1 (<1 1) } 10 10 $ 0 	NB. top left with xy + 1
    a =. (1 0 _1) (|.!.0"1&.>)"1 (1 0 _1) (|.!.0"2&.>)"2 (3 3 $ < mines)
    surrounding =. (+/"_)&(+/"_) @:> a			NB. sum of 3x3
    surrounding + mines * _
  }}
#+end_src

#+begin_src j :noweb yes :results verbatim
  <<genfield>>
  genfield 10 10
#+end_src

#+RESULTS:
#+begin_example
0 0 1 _ 1 1 _ 1 0 0
0 0 1 1 1 1 1 1 0 0
0 0 1 1 1 0 0 0 0 0
0 0 1 _ 1 0 1 1 1 0
0 0 1 1 2 1 2 _ 1 0
0 1 1 1 1 _ 2 1 2 1
1 2 _ 1 1 1 1 0 1 _
_ 2 1 1 0 0 1 1 3 2
1 1 1 1 1 0 1 _ 2 _
0 0 1 _ 1 0 1 1 2 1
#+end_example

* 0's island

out of 0 containing array and coordinates return mask of 0 island under coordinates

it draws close similarities to maze solving

#+name: island
#+begin_src j
  island =: {{
    NB. if. (0 = (<x) { y) do.
      emptys =. y = 0
      point =. 1 (< x) } ($ y) $ 0
      shifted =. {{ ((1 _1) (|.!.0&.>) (2 $ < y)) , ((1 _1) (|.!.0"1&.>)"1 (2 $ < y)) , < y }}
      (emptys * [: +./ [: > shifted)^:_^:(0 = (<x) { y) point
    NB. else.
    NB.   1 (< x) } ($ y) $ 0
    NB. end.
  }}
#+end_src

#+begin_src j :noweb yes :results verbatim
  <<genfield>>
  <<island>>
  field =: genfield 10 10
  field ; (0 0 island field) ; (0 2 island field)
#+end_src

#+RESULTS:
#+begin_example
+-------------------+-------------------+-------------------+
|0 0 1 _ 1 1 _ 1 0 0|1 1 0 0 0 0 0 0 0 0|0 0 1 0 0 0 0 0 0 0|
|0 0 1 1 1 1 1 1 0 0|1 1 0 0 0 0 0 0 0 0|0 0 0 0 0 0 0 0 0 0|
|0 0 1 1 1 0 0 0 0 0|1 1 0 0 0 0 0 0 0 0|0 0 0 0 0 0 0 0 0 0|
|0 0 1 _ 1 0 1 1 1 0|1 1 0 0 0 0 0 0 0 0|0 0 0 0 0 0 0 0 0 0|
|0 0 1 1 2 1 2 _ 1 0|1 1 0 0 0 0 0 0 0 0|0 0 0 0 0 0 0 0 0 0|
|0 1 1 1 1 _ 2 1 2 1|1 0 0 0 0 0 0 0 0 0|0 0 0 0 0 0 0 0 0 0|
|1 2 _ 1 1 1 1 0 1 _|0 0 0 0 0 0 0 0 0 0|0 0 0 0 0 0 0 0 0 0|
|_ 2 1 1 0 0 1 1 3 2|0 0 0 0 0 0 0 0 0 0|0 0 0 0 0 0 0 0 0 0|
|1 1 1 1 1 0 1 _ 2 _|0 0 0 0 0 0 0 0 0 0|0 0 0 0 0 0 0 0 0 0|
|0 0 1 _ 1 0 1 1 2 1|0 0 0 0 0 0 0 0 0 0|0 0 0 0 0 0 0 0 0 0|
+-------------------+-------------------+-------------------+
#+end_example

** potential issues

finding full area of the island is based on blind iteration. in consequence function needs to find maximum amount of steps to "solve the maze" (to run in reasonable time). at the moment it is esstimated to be $2/3 * x^2$

* game

#+name: game
#+begin_src j :results verbatim :noweb yes
  <<island>>
  clear =: {{
    isle =. x island y
    res =. (([: |: (1 0 _1) (([: |: [: [ |.!.0)&.>) ])^:(2) 3 3 $ <)^:(1 < (+/)^:(_) isle) isle
    ([: +./ +./) @:(>) ^:(1 < (+/)^:(_) isle) res
  }}
  check =: {{
    (y +. x clear m) } _ ,: m
  }}
#+end_src

#+begin_src j :results verbatim :noweb yes
  <<genfield>>
  <<game>>
  game =: ((genfield 10 10) check)
  0 9 game _ ~: 1 1 game 10 10 $ 0
  NB. 2 2 clear genfield 10 10
#+end_src

#+RESULTS:
#+begin_example
0 0 1 _ _ _ _ 1 0 0
0 0 1 _ 1 1 1 1 0 0
0 0 1 _ 1 0 0 0 0 0
0 0 1 _ 1 0 1 1 1 0
0 0 1 _ 2 1 2 _ 1 0
0 1 1 _ _ _ _ _ 2 1
1 2 _ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _ _ _
#+end_example
