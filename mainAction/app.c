#include "graphics.h"
 
int calc_neighborhood(int ind_x, int ind_y, int (*squares)[NUM_SQRS_X][NUM_SQRS_Y])
{
    int arr_movement_x[] = {-1, -1, 1, 1, 1, 0, 1, 0};
    int arr_movement_y[] = {0, -1, 0, -1, -1, 0, -1, -1};
    int sz = sizeof(arr_movement_x);

    int next_x, next_y;
    int res = 0;

    for (int i = 0; i < sz; ++i) {
        int next_x = ind_x + arr_movement_x[i];
        int next_y = ind_y + arr_movement_y[i];

        int correctness = (next_x >= 0 && next_y >= 0 && next_x < NUM_SQRS_X && next_y < NUM_SQRS_Y);
        if (correctness && (*squares)[next_x][next_y] == 1) {
            res++;
        }
    }

    return res;
}

void fill_next(int (*squares)[NUM_SQRS_X][NUM_SQRS_Y], int (*squares_next)[NUM_SQRS_X][NUM_SQRS_Y])
{
    int neigbors;
    for (int i = 0; i < NUM_SQRS_X; ++i) {
        for (int j = 0; j < NUM_SQRS_Y; ++j) {
            neigbors = calc_neighborhood(i, j, squares);

            int death_condition = neigbors < 2 || neigbors > 3;
            if (death_condition > 0) {
                (*squares_next)[i][j] = 0;
                continue;
            }
            (*squares_next)[i][j] = 1;
        }
    }
    for (int i = 0; i < NUM_SQRS_X; ++i) {
        for (int j = 0; j < NUM_SQRS_Y; ++j) {
            (*squares)[i][j] = (*squares_next)[i][j];
        }
    }
}

void printSquare(int (*squares)[NUM_SQRS_X][NUM_SQRS_Y], int x, int y) {
    int black = 0;
    int darkorchid = 10040012;

    if ((*squares)[x][y] == 1) {
        for (int i = 0; i < SQR_LEN; ++i) {
            for (int j = 0; j < SQR_LEN; ++j) {
                simPutPixel(x * SQR_LEN + i, y * SQR_LEN + j, darkorchid);
            }
        }

        return;
    }

    for (int i = 0; i < SQR_LEN; ++i) {
        for (int j = 0; j < SQR_LEN; ++j) {
            simPutPixel(x * SQR_LEN + i, y * SQR_LEN + j, black);
        }
    }
}

void app() {
    int squares[NUM_SQRS_X][NUM_SQRS_Y];
    int squares_next[NUM_SQRS_X][NUM_SQRS_Y];

    // I want each sqr_num-iest square to be plotted at the start. 
    int sqr_num = 100;

    // Here random squares are generated.
    for (int i = 0; i < NUM_SQRS_X; ++i) {
        for (int j = 0; j < NUM_SQRS_Y; ++j) {
            int random = simRand() % sqr_num;
            if (random < 1) {
                squares[i][j] = 1;
                continue;
            }
            squares[i][j] = 0;
        }
    }

    // Here life processes live.
    for (int step = 0; step < 1000; ++step) {
        for (int y = 0; y < NUM_SQRS_Y; ++y) {
            for (int x = 0; x < NUM_SQRS_X; ++x) {
                printSquare(&squares, x, y);
            }
        }
        fill_next(&squares, &squares_next);
        simFlush();
    }
}