/*
** EPITECH PROJECT, 2019
** Get_Next_Line
** File description:
** Re-Write getnextline fct.
*/

#include "get_next_line.h"

char *my_strcat(char **static_temp, char *buffer, int size)
{
    char *result;
    int i = 0;

    if (*static_temp == NULL)
        return (buffer);
    for (; (*static_temp)[i] && (*static_temp)[i] != '\n'; ++i);
    if ((result = malloc(sizeof(char) * (size + i + 1))) == NULL)
        return NULL;
    for (i = 0; (*static_temp)[i] && (*static_temp)[i] != '\n'; ++i)
        result[i] = (*static_temp)[i];
    for (; *buffer && *buffer != '\n'; ++i)
        result[i] = *buffer++;
    return (result);
}

char *get_str(char *buffer)
{
    static char *static_temp;
    char *result;
    int i = 0;
    static int count = 0;

    if (count == 0) {
        if ((static_temp = malloc(sizeof(char) * (READ_SIZE + 1))) == NULL)
            return (NULL);
        count = 1;
    }
    for (i = 0; buffer[i] != '\n' && buffer[i]; ++i);
    if (buffer[i] == '\0' && i < READ_SIZE)
        return (my_strcat(&static_temp, buffer, i));
    else if (buffer[i] == '\n') {
        result = my_strcat(&static_temp, buffer, i);
        for (i = 0; *buffer && *buffer != '\n'; buffer++);
        static_temp = NULL;;
        static_temp = my_strcat(&static_temp, ++buffer, i);
        return (result);
    } else {
        static_temp = my_strcat(&static_temp, buffer, READ_SIZE);
        return NULL;
    }
}

char *get_next_line(int fd)
{
    size_t read_tmp = 0;
    char *check = NULL;
    char *buffer= malloc(sizeof(char) * (READ_SIZE + 1));

    if (buffer == NULL || fd < 0)
        return NULL;
    while (check == NULL) {
        if ((read_tmp = read(fd, buffer, READ_SIZE)) <= 0) {
            free(buffer);
            return NULL;
        } else {
            buffer[READ_SIZE] = '\0';
            check = get_str(buffer);
        }
    }
    return (check);
}
