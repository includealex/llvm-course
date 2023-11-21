#include <stdio.h>

void funcStartLogger(char* funcName){
    printf("[LOG] Start function '%s'\n", funcName);
}

void callLogger(char* calleeName, char* callerName, long int valID){
    printf("[LOG] CALL '%s' -> '%s' {%ld}\n", calleeName, callerName, valID);
}

void funcEndLogger(char* funcName, long int valID){
    printf("[LOG] End function '%s' {%ld}\n", funcName, valID);
}

void ex_foo(int x) {
    if(x == 42) {
        printf("Hi\n");
    }
    else{
        printf("Bye\n");
    }
}

int main() {

    int NUM_SQRS_X = 10000;
    int NUM_SQRS_Y = 10000;
    int sqr_num = 60;
    for (int i = 0; i < NUM_SQRS_X; ++i) {
        for (int j = 0; j < NUM_SQRS_Y; ++j) {
            int random = i * j % sqr_num;
            if (random < 1) {
                printf("Gotcha");
                continue;
            }
        }
    }

    return 0;
}
