---
title: Concepts of Modern Mathematics
---

What is a function?
-------------------

Functions consist of 

* a set `D` (domain)
* a set `T` in which all values `f(x)` lie within (target)
* a singleton set of a rule which, for every `x <- D`, specifies a unique element `f(x)` of `T`. The rule must be defined for every element `x` in the domain. 

The standard notation expressing the fact that `f` is a function with domain `D` and target `T` is:

    f:D -> T,

The range of `f` is not always the `T`. The range is a subset of the target. aka `Range ⊂ T`

* Surjection: If the sets of `T` and `Range` are equal, and f(x) maps the same domain to the same value in both sets, then the function is called a "surjection".
* Injection: If every element of the range has a single domain value mapped to it, then the function is called an "injection"

Injections need not be surjective.

Functions that are both injective and surjective can be "flipped" to create a new function from T to D. These are called bijections or one-to-one correspondences. 

Functions composition is associative:

    (f.g).h = f.(g.h)

The identity function maps every element `x <- D` onto the same element, unchanged

`f` is the inverse of `g` if:

* They are bijections of each other and
* Composing them gives the identity function

    f.g = g.f
    f.g = id


The Beginnings of Abstract Algebra
----------------------------------