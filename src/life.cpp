#include "life.hpp"

int main_() {
    // initial conditions
    int max_size = 700;
    int max_color_val = 256;
    int max_x_val = 1000;
    int x_prev = 1;
    int y_prev = 3;

    // Solutions for characteristics from
    // math physics are x*sinx and y*cosy.
    // I've modified them for some beaty.
    for (int i = 0; i < max_size; ++i) {
        int cnt = 0;
        while (cnt < max_x_val){
            int x_coord = int(x_prev * std::sin(1 + x_prev) + std::rand()) % max_x_val;
            int y_coord = int(x_coord * (1 + std::cos(x_coord)) + y_prev) % max_x_val;
            int r = x_coord * y_coord % max_color_val;
            int g = (x_coord + y_coord) % max_color_val;
            int b = (x_coord + 2 * y_coord) % max_color_val;
            struct Square sqr = {x_coord, y_coord, r, g, b};
            putSquare(sqr);
            ++cnt;
            x_prev = x_coord;
            y_prev = y_coord;
        }
        flush();
    }
    return 0;
}

void putSquare(const Square Square) {
    putDot(
        Square.x,
        Square.y,
        Square.rgb.R,
        Square.rgb.G,
        Square.rgb.B
    );
}