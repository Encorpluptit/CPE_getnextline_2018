/*
** EPITECH PROJECT, 2019
** my_strdup
** File description:
** malloc and cpy string given (stand alone)
*/

#include <stdlib.h>

char *my_strdup(char const *src)
{
    int str_len = 0;
    char *dest = NULL;

    for (int i = 0; src[i]; ++i)
        str_len++;
    dest = malloc(sizeof(char) * (str_len + 1));
    for (int i = 0; src[i]; ++i)
        dest[i] = src[i];
    dest[str_len] = '\0';
    return (dest);
}
