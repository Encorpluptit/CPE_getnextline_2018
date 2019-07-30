/*
** EPITECH PROJECT, 2019
** Any project.
** File description:
** Wraping malloc with Wl ld.
*/

#include <stddef.h>
#include <errno.h>
static int override_malloc = 0;
static int fail_count;
static int fail_countdown;

void *__real_malloc(size_t);
void *__wrap_malloc(size_t s) {
    if (override_malloc && fail_count < fail_countdown) {
        errno = ENOMEM;
        return NULL;
    } else {
        fail_count += 1;
        return __real_malloc(s);
    }
}

#include <criterion/criterion.h>
#include <criterion/redirect.h>
#include "get_next_line.h"
#include <stdbool.h>
//#include ".h"
#include <sys/stat.h>
#include <fcntl.h>


Test(failed_malloc_gn, test_01)
{
    int fd = open("tests/ressources/test_text", O_RDONLY);
    char *res = NULL;

    override_malloc = 1;
    fail_count = 0;
    fail_countdown = 4;
    res = get_next_line(fd);
    close(fd);
    fail_countdown = 1000;
    override_malloc = 0;
    cr_assert_null(res, "resultat = %s", res);
}
