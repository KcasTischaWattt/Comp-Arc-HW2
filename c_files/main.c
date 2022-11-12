#include <stdio.h>

extern void change_string(char *str);

int main() {
    int max_size = 512;
    char str[max_size];
    printf("Your string (maximum %d characters):", max_size);
    fflush(stdin);
    fgets(str, max_size, stdin);
    change_string(str);
    printf("\nYour string: %s\n", str);
}
