# 26 U.S.C. (Internal Revenue Code) Section 1(h)(1) in CoffeeScript

A thought experiment in statute-to-code translation, featuring the
Internal Revenue (tax) Code's infamous capital gains tax rate provision.

Have a look at the [documented source][source]

[source]: http://kemitchell.github.io/26-USC-1-h-1/docs/26-USC-1-h-1.html

## Thoughts

I've intentionally tried to track the language of the statute, without
refactoring and without worrying about execution. Essentially, this is
pseudocode.

I've intentionally tried to keep implementations simple (even naive).

I've avoided as many libraries or techniques as possible. The only
background knowledge required beyond CoffeeScript itself should be
`assert` and Node's module system (`module.exports`).

*This isn't legal advice.* I'm not even sure I'm interpreting the Code
correctly.

`assert` is kind of a cop-out, but it tracks the language well.

Don't do tax calculations in Javascript. (ASM.js, maybe?)
