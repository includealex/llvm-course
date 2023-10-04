#ifndef LLVM_COURSE_INCLUDES_GRAPHICS_HPP
#define LLVM_COURSE_INCLUDES_GRAPHICS_HPP

#include "SFML/Graphics.hpp"

void initWindow(const int limit);
void putDot(int x, int y, int R, int G, int B, int alpha);
void flush();
bool interrupt();

#endif //LLVM_COURSE_INCLUDES_GRAPHICS_HPP
