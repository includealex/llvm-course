#ifndef LLVM_COURSE_INCLUDES_LIFE_HPP
#define LLVM_COURSE_INCLUDES_LIFE_HPP

struct RGB {
  int R;
  int G;
  int B;
};

struct dot {
  int x;
  int y;
  RGB color;
  int existance = 0; // doesn't exist = 0
};

int main_();

#endif //LLVM_COURSE_INCLUDES_LIFE_HPP
