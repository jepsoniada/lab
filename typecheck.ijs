-*- mode: Org -*-

* checking types in J

** primitives

there are 3 primitive types:
- number
- character
- box

but also there are:
- symbol
- sparse numeric
- sparse boxed

each of them fall into one of the following size categories determined by src_J[]{(3!:0)} verb:

#+name: sizeofs
| number | character | box | symbol | sparse numeric | sparse boxed |
|--------+-----------+-----+--------+----------------+--------------|
|      1 |         2 |  32 |  65536 |           1024 |        32768 |
|      4 |    131072 |     |        |           2048 |              |
|     64 |    262144 |     |        |           4096 |              |
|    128 |           |     |        |           8192 |              |
|      8 |           |     |        |          16384 |              |
|      6 |           |     |        |                |              |
|      7 |           |     |        |                |              |
|     11 |           |     |        |                |              |
|     16 |           |     |        |                |              |

source and more details are at [[https://code.jsoftware.com/wiki/Vocabulary/Nouns#Type][jsoftware]]

*** solutions

#+begin_src j :results verbatim
  typeof =. {{
     kv =. {{
        key =. <^:(2 > #y) ;/ ((#x) ,~ # y) $ x
        (2 , # y) $ key ,~ (<^:(2 > #y) ;/ y)
     }}
     
     res =. ('number' kv 1 4 64 128 8 6 7 11 16)
     res =. res ,"1 ('character' kv 2 131072 262144 )
     res =. res ,"1 ('sparse boxed' kv 32768)
     res =. res ,"1 ('sparse numeric' kv 1024 2048 4096 8192 16384)
     res =. res ,"1 ('symbol' kv 65536)
     res =. res ,"1 ('box' kv 32)
     
     > 1 { res {~ < a: ; I. ((3!:0) y) = > 0 { res
  }}

  typeof (2 2 2 $ <&< 32)
#+end_src

#+RESULTS:
: box

#+name: sizeoffn
#+begin_src j :results verbatim
  (3!:0"0) (2 2 2 $< 21)
#+end_src

#+begin_src emacs-lisp :colnames no :var num=sizeofs :var zxcv=sizeoffn() :results verbatim
  (defun typeoffromsizeof (size)
    (setf asdf (car num))
    (setf num^T (cl-loop for a in (number-sequence 0 (- (length asdf) 1))
    		       collect (nconc (list (nth a asdf)) (cl-loop for b in (cdr num)
    								   collect (prin1-to-string (nth a b))))))
    (car (cl-loop for a in num^T
  	   when (member size a)
  	   collect (car a)))
    )
  (typeoffromsizeof (string-trim zxcv))
#+end_src

#+RESULTS:
: "box"

** TODO shape

