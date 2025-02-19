#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int ac, char *av[])
{
    if (ac != 2) {
        printf("usage: %s string\n", av[0]);
        return 1;
    }

    char *str = strdup(av[1]);
    int i = 0;

    while (str[i]) {
        str[i] = str[i] - i;
        i++;
    }
    printf("%s\n", str);
    free(str);
    return 0;
}