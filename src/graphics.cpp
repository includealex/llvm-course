#include "graphics.hpp"

constexpr float sqr_sz = 8;
constexpr int display_width = 800;

sf::RenderWindow window{{display_width, display_width}, "gameGraphics"};

void initWindow(const int limit) { window.setFramerateLimit(limit); }

void putDot(int x, int y, u_char R, u_char G, u_char B, u_char alpha) {
  sf::RectangleShape rectangle{sf::Vector2f{sqr_sz, sqr_sz}};
  rectangle.setPosition(x * sqr_sz, y * sqr_sz);
  rectangle.setFillColor(sf::Color{R, G, B, alpha});
  window.draw(rectangle);
}

void flush() {
  window.display();
  window.clear();
}
