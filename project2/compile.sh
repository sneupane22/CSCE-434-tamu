./dcc < output/bad1.decaf > output/bad1.out 2>&1
./dcc < output/bad2.decaf > output/bad2.out 2>&1
./dcc < output/bad3.decaf > output/bad3.out 2>&1
./dcc < output/bad4.decaf > output/bad4.out 2>&1
./dcc < output/bad5.decaf > output/bad5.out 2>&1
./dcc < output/bad6.decaf > output/bad6.out 2>&1
./dcc < output/bad7.decaf > output/bad7.out 2>&1
./dcc < output/class.decaf > output/class.out 2>&1
./dcc < output/control.decaf > output/control.out 2>&1
./dcc < output/expressions.decaf > output/expressions.out 2>&1
./dcc < output/functions.decaf > output/functions.out 2>&1
./dcc < output/incrdecr.decaf > output/incrdecr.out 2>&1
./dcc < output/inheritance.decaf > output/inheritance.out 2>&1
./dcc < output/interface.decaf > output/interface.out 2>&1
./dcc < output/matrix.decaf > output/matrix.out 2>&1
./dcc < output/simple.decaf > output/simple.out 2>&1
./dcc < output/switch.decaf > output/switch.out 2>&1
diff -bur output/ samples/
