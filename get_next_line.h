/*
** EPITECH PROJECT, 2019
** Get_Next_Line
** File description:
** Re-Write the getnextline fct.
*/

#ifndef __GET_NEXT_LINE_H__
#define __GET_NEXT_LINE_H__

#include <stdlib.h>
#include <stddef.h>
#include <stdio.h>
#include <unistd.h>

#ifndef __READ_SIZE__
#define __READ_SIZE__
#define READ_SIZE (20)
#endif

char *get_next_line(int fd);
char *my_strcat(char **static_temp, char *buffer, int size);
#endif
