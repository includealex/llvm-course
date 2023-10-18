#ifndef INCLUDES_GRAPHICS_H
#define INCLUDES_GRAPHICS_H

#include <assert.h>
#include <stdlib.h>
#include <time.h>

#include <SDL2/SDL.h>

#define SQR_LEN 10
#define SIM_X_SIZE 800
#define SIM_Y_SIZE 1200

#define NUM_SQRS_X SIM_X_SIZE / SQR_LEN
#define NUM_SQRS_Y SIM_Y_SIZE / SQR_LEN

void simFlush();
void simPutPixel(int x, int y, int argb);
int simRand();

#endif // INCLUDES_GRAPHICS_H
