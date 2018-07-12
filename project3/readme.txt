This is my implementation.

The idea is to keep two kinds of scopes. One is a global scope which I use to
search for classes and functions. The other one is local for individual classes
and functions and statement blocks. I pass those around and check against them.

I implemented variables, functions, and classes, interfaces (although I don't
understand it), and extending a class.

You will also notice that the order of the output might differ. This is
natural. Also, you might see that a declaration might conflict with a later one,
and this is due to the nature of the algorithm I am using. It uses a
recursive-style scoping.
