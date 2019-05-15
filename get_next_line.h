/*
** EPITECH PROJECT, 2019
** GetNextLine.
** File description:
** Header for GNL.
*/

#ifndef _GET_NEXT_LINE_H_
#define _GET_NEXT_LINE_H_

#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stddef.h>
#include <stdbool.h>

#ifndef _READ_SIZE_
#define READ_SIZE 40
#endif /* _READ_SIZE_ */

char *get_next_line(int fd);

#endif /* _GET_NEXT_LINE_H_ */
