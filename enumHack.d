-*- mode: org; org-confirm-babel-evaluate: nil -*-

`enum' should wokr the same as `static auto'

#+begin_src d
  import std.stdio;
  static auto a = 1;
  a.writeln;
#+end_src

#+RESULTS:
: 1

#+begin_src d
  import std.stdio;
  enum b = 1;
  b.writeln;
#+end_src

#+RESULTS:
: 1
