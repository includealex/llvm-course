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

void binOptLogger(int val, int arg0, int arg1, char* opName, char* funcName, long int valID){
    printf("[LOG] In function '%s': %d = %d %s %d {%ld}\n", funcName, val, arg0, opName, arg1, valID);
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
    int x = 42;
    ex_foo(x);

    return 0;
}