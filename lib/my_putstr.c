/*
** EPITECH PROJECT, 2019
** my_putstr.c
** File description:
** my_putstr.c
*/

#include <unistd.h>

int my_putstr(char const *str)
{
    int i = 0;

    for (i = 0; str[i] != '\0'; i++);
    write(1, str, i);
    return (i);
}
