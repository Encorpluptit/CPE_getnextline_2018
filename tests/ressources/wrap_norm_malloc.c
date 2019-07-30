/*
** EPITECH PROJECT, 2019
** get_next_line
** File description:
** Unit test for failed_malloc..
*/

#include "tests_run.h"
#include "get_next_line.h"
#include <sys/stat.h>
#include <fcntl.h>

void *wrap_malloc(size_t size, int statik, int flag)
{
    static long stop = 0;
    static long max = 999999999999999;

    if (!flag)
        max = statik;
    if (flag == 1 && stop < max) {
        if (stop < max) {
            stop += 1;
            return (__builtin_malloc(size));
        } else
            return NULL;
    }
    if (flag == 2)
        max = 999999999999999;
}

Test(failed_malloc_gnl, test_01)
{
    int fd = open("tests/ressources/test_text", O_RDONLY);
    char *res;

    wrap_malloc(0, 0, 0);
    res = get_next_line(fd);
    close(fd);
    wrap_malloc(0, 0, 2);
    cr_assert_null(res, "resultat = %s", res);
}

Test(failed_malloc_init_buffer, test_02)
{
    char *line = NULL;
    char *buffer = NULL;
    char *save_buffer = buffer;
    int res = -42;

    wrap_malloc(0, 0, 0);
    res =init_buffer(&line, &buffer, &save_buffer);
    wrap_malloc(0, 0, 2);
    cr_assert_null(buffer, "resultat = %s", buffer);
    cr_assert_eq(res, FAILED_MALLOC);
}

Test(failed_malloc_str_cat, test_03)
{
    char *line = NULL;
    char *buffer = strdup("coucou\net toi\nas");
    char *buffer2 = strdup("coucou\net toi\nas");
    char *save_buffer = buffer;
    int res = -42;

    wrap_malloc(0, 0, 0);
    res = my_strcat(&line, &buffer, &save_buffer);
    wrap_malloc(0, 0, 2);
    cr_assert_str_eq(buffer, buffer2, "resultat = %s", buffer);
    cr_assert_eq(res, FAILED_MALLOC);
}

Test(failed_malloc_my_realloc, test_04)
{
    char *str = strdup("coucou\net toi\nas");
    char *res = str;

    wrap_malloc(0, 0, 0);
    str = my_realloc(str, 80);
    wrap_malloc(0, 0, 2);
    cr_assert_null(str, "resultat = %s", str);
}

Test(failed_malloc_gnl, test_05)
{
    int fd = open("tests/ressources/test_text", O_RDONLY);
    char *res;

    wrap_malloc(0, 3, 0);
    res = get_next_line(fd);
    close(fd);
    wrap_malloc(0, 0, 2);
    cr_assert_null(res, "resultat = %s", res);
}
