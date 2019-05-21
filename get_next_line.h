/*
** EPITECH PROJECT, 2019
** Get_Next_Line
** File description:
** Re-Write the getnextline fct.
*/

#ifndef __READ_SIZE__
#define __READ_SIZE__
#define READ_SIZE (20)
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
static const bool END_LINE = true;
static const bool END = false;

static inline bool check_endline(char c)
{
    return (c == '\n');
}

char *get_next_line(int fd);
char *my_realloc(char *ptr, size_t size);
int my_strcat(char **line, char **buffer);
int init_buffer(char **buffer, char **line);

#endif
