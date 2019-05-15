/*
** EPITECH PROJECT, 2019
** GetNextLine.
** File description:
** merde.
*/

#include "get_next_line.h"

static char *my_realloc(char *ptr, size_t size)
{
    char *new = NULL;
    char *pnew;

    if (ptr == NULL)
        return malloc(size);
    if (size == 0) {
        free(ptr);
        return NULL;
    }
    new = malloc(size);
    if (new == NULL)
        return NULL;
    pnew = new;
    for (; size && *ptr; size = size -1)
        *(pnew++) = *(ptr++);
    return new;
}

static int strcat_to(char **line, char **buffer)
{
    char *buff_end = *buffer;
    char *line_cpy = *line;
    size_t i = 0;

    for (; *buff_end != '\n' && *buff_end; buff_end = buff_end + 1);
    if (*line != NULL)
        for (; *(line_cpy + i); i = i + 1);
    *line = my_realloc(*line, (i + (buff_end - *buffer) + 1) * sizeof(char));
    if (*line == NULL)
        return -1;
    line_cpy = *line;
    for (; *buffer != buff_end; *buffer = *buffer + 1)
        *(line_cpy++ + i) = **buffer;
    *(line_cpy + i) = '\0';
    *buffer += *buff_end == '\n' ? 1 : 0;
    return *buff_end == '\n' ? 1 : 0;
}

static int init_gnl(char **buffer, char **line)
{
    if (*buffer == NULL || **buffer == '\0') {
        *buffer = malloc((READ_SIZE + 1) * sizeof(char));
        if (*buffer == NULL)
            return -1;
        return 0;
    }
    if (strcat_to(line, buffer) == 1) {
        if (*line == NULL)
            return -1;
        return 1;
    }
    return 0;
}

char *get_next_line(int fd)
{
    static char *buffer = NULL;
    char *line = NULL;
    int ret = init_gnl(&buffer, &line);

    if (ret == 1) {
        return line;
    } else if (ret == -1)
        return NULL;
    while ((ret = read(fd, buffer, READ_SIZE)) > 0) {
        buffer[ret] = '\0';
        ret = strcat_to(&line, &buffer);
        if (ret == 1) {
            break;
        } else if (ret == -1)
            return NULL;
    }
    return line;
}
