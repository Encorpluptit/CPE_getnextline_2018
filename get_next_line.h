/*
** EPITECH PROJECT, 2019
** Get_Next_Line
** File description:
** Re-Write the getnextline fct.
*/

#ifndef __READ_SIZE__
#define __READ_SIZE__
#define READ_SIZE (1)
#endif

#ifndef __GET_NEXT_LINE_H__
#define __GET_NEXT_LINE_H__

#include <stdlib.h>
#include <stddef.h>
#include <stdio.h>
#include <unistd.h>
#include <stdbool.h>

static const int FAILED_MALLOC = -1;
static const int VALID_MALLOC = 42;
static const int ERROR = 84;
static const int END_LINE = 1;
static const int END = 0;

char *get_next_line(int fd);
char *my_realloc(char *ptr, size_t size);
int my_strcat(char **line, char **buffer, char **save_buffer);
int init_buffer(char **buffer, char **line, char **save_buffer);

#endif
