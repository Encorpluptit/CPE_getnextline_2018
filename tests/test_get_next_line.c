/*
** EPITECH PROJECT, 2019
** Any project
** File description:
** Template for criterion unit test.
*/

#include "get_next_line.h"
#include <criterion/criterion.h>
#include <criterion/redirect.h>
#include <sys/stat.h>
#include <fcntl.h>

Test(fct, test_01)
{
    char *res = NULL;

    res = my_realloc(res, sizeof(char) * (5 + 1));
    cr_assert_not_null(res, "resultat = %s", res);
}

Test(fct, test_02)
{
    char *res = malloc(sizeof(char) * (5 + 1));

    for (int i = 0; res[i]; ++i)
        res[i] = 'a';
    res = my_realloc(res, 0);
    cr_assert_null(res, "resultat = %p", res);
}

Test(fct, test_03)
{
    char *line = strdup("Hello ");
    char *buffer = strdup("World!");
    char *str_res = strdup("Hello World!");
    char *save_buffer = buffer;
    int res = my_strcat(&line, &buffer, &save_buffer);

    cr_assert_str_eq(line, str_res, "resultat = %s", line);
    cr_assert_eq(res, 0, "resultat = %d", res);
}

Test(fct, test_04)
{
    char *str1 = strdup("Salut,");
    char *str2 = strdup(" ça");
    char *str3 = strdup(" va");
    char *str4 = strdup(" les amis ?");
    char *str_res = strdup("Salut, ça va les amis ?");
    char *save_buffer = str2;
    int res = my_strcat(&str1, &str2, &save_buffer);

    cr_assert_str_eq(str1, "Salut, ça", "resultat = %s", str1);
    cr_assert_eq(res, 0, "resultat = %d", res);
    save_buffer = str3;
    res = my_strcat(&str1, &str3, &save_buffer);
    save_buffer = str4;
    res = my_strcat(&str1, &str4, &save_buffer);
    cr_assert_str_eq(str1, str_res, "resultat = %s", str1);
    cr_assert_eq(res, 0, "resultat = %d", res);
}

Test(fct, test_05)
{
    char *line = NULL;
    char *str1 = strdup("Salut,");
    char *str2 = strdup(" ça");
    char *str3 = strdup(" va");
    char *str4 = strdup(" les amis ?");
    char *str_res = strdup("Salut, ça va les amis ?");
    char *save_buffer = str1;
    int res = my_strcat(&line, &str1, &save_buffer);

    save_buffer = str2;
    res = my_strcat(&line, &str2, &save_buffer);
    save_buffer = str3;
    res = my_strcat(&line, &str3, &save_buffer);
    save_buffer = str4;
    res = my_strcat(&line, &str4, &save_buffer);
    cr_assert_str_eq(line, str_res, "resultat = %s", line);
    cr_assert_eq(res, 0, "resultat = %d", res);
}

Test(fct, test_06)
{
    char *line = NULL;
    char *str1 = strdup("Salut,");
    char *str2 = strdup(" ça");
    char *str3 = strdup(" va");
    char *str4 = strdup(" les amis");
    char *str5 = " ?\nCoucou";
    char *str_res = strdup("Salut, ça va les amis ?");
    char *save_buffer = str1;
    int res = my_strcat(&line, &str1, &save_buffer);

    save_buffer = str2;
    res = my_strcat(&line, &str2, &save_buffer);
    save_buffer = str3;
    res = my_strcat(&line, &str3, &save_buffer);
    save_buffer = str4;
    res = my_strcat(&line, &str4, &save_buffer);
    save_buffer = str5;
    res = my_strcat(&line, &str5, &save_buffer);
    cr_assert_str_eq(line, str_res, "resultat = %s", line);
    cr_assert_eq(res, 1, "resultat = %d", res);
}

Test(fct, test_07)
{
    char *buffer = NULL;
    char *line = NULL;
    char *save_buffer = buffer;
    int res = init_buffer(&line, &buffer, &save_buffer);

    cr_assert_not_null(buffer, "resultat = %s", buffer);
    cr_assert_not_null(save_buffer, "resultat = %s", save_buffer);
    cr_assert_eq(res, VALID_MALLOC, "Resultat = %d", res);
}

Test(fct, test_08)
{
    char *buffer = strdup("aaa");
    char *line = NULL;
    char *save_buffer = buffer;
    int res = init_buffer(&line, &buffer, &save_buffer);

    cr_expect_not_null(buffer, "resultat = %s", buffer);
    cr_assert_not_null(save_buffer, "resultat = %s", save_buffer);
    cr_expect_str_eq(line, "aaa", "resultat = %s", line);
    cr_expect_eq(res, 0, "Resultat = %d", res);
}

Test(fct, test_09)
{
    char *buffer = "aaa\na";
    char *line = NULL;
    char *save_buffer = buffer;
    int res = init_buffer(&line, &buffer, &save_buffer);

    cr_expect_not_null(buffer, "resultat = %s", buffer);
    cr_expect_str_eq(line, "aaa", "resultat = %s", line);
    cr_expect_str_eq(buffer, "a", "resultat = %s", buffer);
    cr_expect_eq(res, 1, "Resultat = %d", res);
}

Test(fct, test_10)
{
    char *buffer = "aaa\n";
    char *line = NULL;
    char *save_buffer = buffer;
    int res = init_buffer(&line, &buffer, &save_buffer);

    cr_expect_not_null(buffer, "resultat = %s", buffer);
    cr_expect_str_eq(line, "aaa", "resultat = %s", line);
    cr_expect_str_eq(buffer, "\0", "resultat = %s", buffer);
    cr_expect_eq(res, 1, "Resultat = %d", res);
}

Test(fct, test_11)
{
    char *buffer = strdup("aaa\0");
    char *line = NULL;
    char *save_buffer = buffer;
    int res = init_buffer(&line, &buffer, &save_buffer);

    cr_expect_not_null(buffer, "resultat = %s", buffer);
    cr_expect_str_eq(line, "aaa", "resultat = %s", line);
    cr_expect_str_eq(buffer, "\0", "resultat = %s", buffer);
    cr_expect_eq(res, 0, "Resultat = %d", res);
}

Test(fct, test_12)
{
    char *res = calloc(sizeof(char), (5 + 1));

    for (int i = 0; i < 5; ++i)
        res[i] = 'a';
    res = my_realloc(res, 7);
    cr_assert_eq(res[0], 'a', "resultat = %s", res);
    cr_assert_eq(res[1], 'a', "resultat = %c", res[1]);
    cr_assert_eq(res[2], 'a', "resultat = %c", res[2]);
    cr_assert_eq(res[3], 'a', "resultat = %c", res[3]);
    cr_assert_eq(res[4], 'a', "resultat = %c", res[4]);
    cr_assert_eq(res[5], '\0', "resultat = %c", res[5]);
}

Test(fct, test_13)
{
    int fd = -1;
    char *res = get_next_line(-1);

    cr_assert_null(res, "resultat = %s", res);
}

Test(fct, test_14)
{
    int fd = open("tests/test_text", O_RDONLY);
    char *res = get_next_line(fd);
    char *result = "Confidence is so overrated.";

    res =get_next_line(fd);
    close(fd);
    cr_assert_str_eq(res, result, "resultat = %s", res);
}

Test(fct, test_15)
{
    int fd = open("tests/test_text", O_RDONLY);
    char *res = get_next_line(fd);
    char *result = "It's when we're most uncomfortable and in desparate \
need of an answer that we growthe most.";

    res = get_next_line(fd);
    res = get_next_line(fd);
    close(fd);
    cr_assert_str_eq(res, result, "resultat = %s", res);
}

Test(fct, test_16)
{
    int fd = open("tests/test_text", O_RDONLY);
    char *result = "The file contain the following content:";
    char *res = get_next_line(fd);

    close(fd);
    cr_assert_str_eq(res, result, "resultat = %s", res);
}

Test(fct, test_17)
{
    int fd = open("tests/test_endline", O_RDONLY);
    char *res = get_next_line(fd);

    res =get_next_line(fd);
    res =get_next_line(fd);
    res =get_next_line(fd);
    res =get_next_line(fd);
    res =get_next_line(fd);
    res =get_next_line(fd);
    res =get_next_line(fd);
    res =get_next_line(fd);
    res =get_next_line(fd);
    res =get_next_line(fd);
    res =get_next_line(fd);
    close(fd);
    cr_assert_null(res, "resultat = %s", res);
}
/*
Test(fct, test_18)
{
    cr_assert_eq(fct(A), R, "resultat = %d", R);

}

Test(fct, test_19)
{
    cr_assert_eq(fct(A), R, "resultat = %d", R);
}

Test(fct, test_20)
{
    cr_assert_eq(fct(A), R, "resultat = %d", R);
}
*/
Test(fct, test_21)
{
    char *res = malloc(sizeof(char) * (5 + 1));

    for (int i = 0; res[i]; ++i)
        res[i] = 'a';
    res = my_realloc(res, 9);
    for (int i = 0; res[i]; ++i)
        cr_assert_eq(res[i], 'a', "resultat = %c", res[i]);
}
/*
Test(fct, test_22)
{
    cr_assert_eq(fct(A), R, "resultat = %d", R);
}

Test(fct, test_23)
{
    cr_assert_eq(fct(A), R, "resultat = %d", R);
}

Test(fct, test_24)
{
    cr_assert_eq(fct(A), R, "resultat = %d", R);
}

Test(fct, test_25)
{
    cr_assert_eq(fct(A), R, "resultat = %d", R);
}
*/
