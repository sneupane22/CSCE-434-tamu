This is the solution for pp4.

issue 1: circular extention problem is ignored. I assumed that the Decaf
Language accepts circular inheritance although I am not sure how such thing is
going to be implemented.

Thus, if class A extends B and class B extends A, I am assuming that A and B are
equivalent when an assign operation is done between them. However, if comparison
or equality operation is done using both class A and B, then the operation is
assumed to be faulty and the compiler gives an error.

issue 2: There is no clear direction on the type retured by expressions. Take
the example: e1 && e2. The given binary assumes automatically that the resulting
expression is a boolean type even if e1 or e2 had errors. On the other hand, the
given binary does not assume that e1 % e2 is an integer if one of the
expressions is of error type.

