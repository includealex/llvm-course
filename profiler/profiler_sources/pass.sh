#!/usr/bin/bash


clang++ -std=c++17 ./prof_pass.cpp -c -fPIC -I/usr/bin/llvm-lib-17/include -o Pass.o
clang++ -std=c++17 Pass.o -fPIC -shared -o ./libPass.so
clang++ -std=c++17 ./main.cpp -Xclang -load -Xclang ./libPass.so -O2 
