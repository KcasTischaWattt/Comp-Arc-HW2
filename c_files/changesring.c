#include <stdio.h>
#include <string.h>

void change_string(char *str) {
    char vowels[5] = {'e', 'i', 'o', 'u', 'y'};
    for (int i = 0; i < strlen(str); ++i) {
        if (str[i] > 'a' && str[i] <= 'z') {
            int flag = 0;
            for (int j = 0; j < 5; ++j) {
                if (vowels[j] == str[i]) {
                    flag = 1;
                    break;
                }
            }
            if (flag == 1) {
                continue;
            }
            str[i] = str[i] - 32;
        }
    }
}

