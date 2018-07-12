./dcc < output/badbool.frag > output/badbool.out
./dcc < output/baddouble.frag > output/baddouble.out
./dcc < output/badint.frag > output/badint.out
./dcc < output/badident.frag > output/badident.out
./dcc < output/badop.frag > output/badop.out
./dcc < output/badpre.frag > output/badpre.out
./dcc < output/badreserve.frag > output/badreserve.out
./dcc < output/badstring.frag > output/badstring.out
./dcc < output/comment.frag > output/comment.out
./dcc < output/define.frag > output/define.out
./dcc < output/ident.frag > output/ident.out
./dcc < output/number.frag > output/number.out
./dcc < output/program2.decaf > output/program2.out
./dcc < output/program3.decaf > output/program3.out
./dcc < output/reserve_op.frag > output/reserve_op.out
./dcc < output/string.frag > output/string.out
diff -bur output/ samples/
