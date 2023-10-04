#ifndef LLVM_COURSE_INCLUDES_LIFE_HPP
#define LLVM_COURSE_INCLUDES_LIFE_HPP

#include "graphics.hpp"
#include <math.h>

struct RGB {
    int R;
    int G;
    int B;
};

struct Square {
    int x;
    int y;
    RGB rgb{};
};

int main_();
void putSquare(const Square Square);

#endif // LLVM_COURSE_INCLUDES_LIFE_HPP
