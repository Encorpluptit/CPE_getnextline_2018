/*
** EPITECH PROJECT, 2019
** get_next_line
** File description:
** header for wrap malloc
*/

#include <stddef.h>
#ifdef WRAP
static inline void *malloc(size_t size)
{
    return NULL;
}
#endif

/*
#ifndef WRAP
#define WRAP 0
    #if WRAP == 1
        #define malloc(size) (NULL)
        #define ZERA 85
    #else
        #define malloc(size) (malloc(size))
    #endif
#endif
*/
