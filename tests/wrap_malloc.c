/*
** EPITECH PROJECT, 2019
** get_next_line
** File description:
** Unit test for failed_malloc..
*/

#include "wrap_malloc.h"
#include "get_next_line.h"
#include <criterion/criterion.h>
#include <criterion/redirect.h>
#include <sys/stat.h>
#include <fcntl.h>

Test(failed_malloc_gnl, test_01)
{
    int fd = open("tests/test_text", O_RDONLY);
    char *res;

    res = get_next_line(fd);
    close(fd);
    cr_assert_null(res, "resultat = %s", res);
}

Test(failed_malloc_init_buffer, test_02)
{
    char *line = NULL;
    char *buffer = NULL;
    char *save_buffer = buffer;
    int res = init_buffer(&line, &buffer, &save_buffer);

    cr_assert_null(buffer, "resultat = %s", res);
    cr_assert_eq(res, FAILED_MALLOC);
}
