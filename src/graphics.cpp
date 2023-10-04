#include "graphics.hpp"

//TODO:
// To get independent from floats in the putDot function.

constexpr int SHAPE_SIZE = 8;
constexpr int COUNT = 100;
constexpr int DISPLAY_SIZE = COUNT * SHAPE_SIZE;

sf::RenderWindow window{ { DISPLAY_SIZE, DISPLAY_SIZE }, "Game graphics" };

void initWindow(const int limit) {
    window.setFramerateLimit(limit);
}

void putDot(int x, int y, int R, int G, int B, int alpha = 255) {
    sf::RectangleShape rectangle{sf::Vector2f{SHAPE_SIZE, SHAPE_SIZE}};
    rectangle.setPosition(x * SHAPE_SIZE, y * SHAPE_SIZE);
    rectangle.setFillColor(sf::Color{R, G, B, alpha});
    window.draw(rectangle);
}

void flush() {
    window.display();
    window.clear();
}

bool interrupt() {
    auto event = sf::Event{};
    window.pollEvent(event);
    return event.type == sf::Event::KeyPressed;
}