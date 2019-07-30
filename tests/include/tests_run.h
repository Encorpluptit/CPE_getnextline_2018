/*
** EPITECH PROJECT, 2019
** get_next_line
** File description:
** header for wrap malloc
*/

/* #ifdef WRAP */
/* #include <stddef.h> */

/* void *wrap_malloc(size_t size, int statik, int flag); */

/* static inline void *malloc(size_t size) */
/* { */
/*     return (wrap_malloc(size, 0, 1)); */
/* } */
/* #endif /\* _WRAP_MALLOC_ *\/ */


#ifdef WRAP
#include <stddef.h>


static inline void *malloc(size_t size)
{
    return NULL;
}
#endif /* _WRAP_MALLOC_ */


#ifndef _TESTS_RUN_
#define _TESTS_RUN_

#include <criterion/criterion.h>
#include <criterion/redirect.h>

static inline void redirect_all_std(void)
{
    cr_redirect_stdout();
    cr_redirect_stderr();
}

#endif /* _TESTS_RUN_ */
