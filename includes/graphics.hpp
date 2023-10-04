#ifndef LLVM_COURSE_INCLUDES_GRAPHICS_HPP
#define LLVM_COURSE_INCLUDES_GRAPHICS_HPP

#include <SFML/Graphics.hpp>

void initWindow(const int limit = 30);
void putDot(int x, int y, u_char R, u_char G, u_char B, u_char alpha = 255);
void flush();

#endif // LLVM_COURSE_INCLUDES_GRAPHICS_HPP
