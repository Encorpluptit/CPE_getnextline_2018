/*
** EPITECH PROJECT, 2019
** Get_Next_Line
** File description:
** Reprocduce the get_next_line function behavior.
*/

#include "../tests/include/tests_run.h"
#include "get_next_line.h"

char *get_next_line(int fd)
{
    static char *buffer = NULL;
    static char *save_buffer = NULL;
    char *line = NULL;
    int read_rt = init_buffer(&line, &buffer, &save_buffer);

    if (read_rt == FAILED_MALLOC || fd < 0)
        return NULL;
    else if (read_rt == END_LINE)
        return (line);
    while ((read_rt = read(fd, buffer, READ_SIZE)) > 0) {
        buffer[read_rt] = '\0';
        read_rt = my_strcat(&line, &buffer, &save_buffer);
        if (read_rt == FAILED_MALLOC)
            return NULL;
        if (read_rt == END_LINE)
            return (line);
    }
    free(buffer);
    buffer = NULL;
    return (line);
}

int init_buffer(char **line, char **buffer, char **save_buffer)
{
    if (*buffer == NULL || **buffer == '\0') {
        if (*buffer)
            free(*save_buffer);
        *buffer = malloc(sizeof(char) * (READ_SIZE + 1));
        *save_buffer = *buffer;
        if (*buffer == NULL)
            return FAILED_MALLOC;
        else
            return VALID_MALLOC;
    }
    return (my_strcat(line, buffer, save_buffer));
}

int my_strcat(char **line, char **buffer, char **save_buffer)
{
    char *buff_cpy = *buffer;
    int i = 0;

    for (; *buff_cpy && *buff_cpy != '\n'; buff_cpy++);
    if (*line != NULL)
        for (; (*line)[i]; i++);
    *line = my_realloc(*line, sizeof(char) * (i + (buff_cpy - *buffer) + 1));
    if (*line == NULL)
        return FAILED_MALLOC;
    for (; *buffer != buff_cpy;)
        (*line)[i++] = *((*buffer)++);
    (*line)[i] = '\0';
    if (**buffer == '\0') {
        free(*save_buffer);
        *buffer = malloc(sizeof(char) * (READ_SIZE + 1));
        *save_buffer = *buffer;
        return (END);
    }
    *buffer += (**buffer == '\n' ? 1 : 0);
    return (*buff_cpy == '\n' ? END_LINE : END);
}

char *my_realloc(char *ptr, size_t size)
{
    char *result = NULL;
    char *tmp = NULL;
    char *ptr_free = ptr;

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
    free(ptr_free);
    return (result);
}
