/*
** EPITECH PROJECT, 2019
** Get_Next_Line
** File description:
** Reprocduce the get_next_line function behavior.
*/

#include "get_next_line.h"

char *get_next_line(int fd)
{
    static char *buffer = NULL;
    char *line = NULL;
    int read_rt = init_buffer(&line, &buffer);

    if (read_rt == FAILED_MALLOC || fd < 0)
        return NULL;
    else if (read_rt == END_LINE)
        return (line);
    else
        while ((read_rt = read(fd, buffer, READ_SIZE)) > 0) {
            buffer[read_rt] = '\0';
            read_rt = my_strcat(&line, &buffer);
            if (read_rt == FAILED_MALLOC)
                return NULL;
            if (read_rt == END_LINE)
                return (line);
            buffer = my_realloc(buffer, (sizeof(char) * (READ_SIZE + 1)));
        }
    return (line);
}

int init_buffer(char **line, char **buffer)
{
    if (*buffer == NULL || **buffer == '\0') {
        *buffer = malloc(sizeof(char) * (READ_SIZE + 1));
        if (*buffer == NULL)
            return FAILED_MALLOC;
        else
            return VALID_MALLOC;
    }
    if (my_strcat(line, buffer) == END_LINE)
        return (END_LINE);
    return (END);
}
//mettre strcat directement dans le return ?

int my_strcat(char **line, char **buffer)
{
    char *buff_cpy = *buffer;
    size_t i = 0;

    for (; *buff_cpy && check_endline(*buff_cpy) != 1; buff_cpy++);
    if (*line != NULL)
        for (; (*line)[i]; i++);
    *line = my_realloc(*line, sizeof(char) * (i + (buff_cpy - *buffer) + 1));
    if (*line == NULL)
        return FAILED_MALLOC;
    for (; *buffer != buff_cpy;)
        (*line)[i++] = *((*buffer)++);
    (*line)[i] = '\0';
    return (check_endline(*(*buffer)++));
}

char *my_realloc(char *ptr, size_t size)
{
    char *result = NULL;
    char *tmp = NULL;

    if (ptr == NULL)
        return (malloc(size));
    if (size == 0) {
        free(ptr);
        return NULL;
    }
    result = malloc(size);
    if (result == NULL)
        return NULL;
    tmp = result;
    for (; *ptr && size != 0; size -= 1)
        *(tmp++) = *(ptr++);
    return (result);
}
