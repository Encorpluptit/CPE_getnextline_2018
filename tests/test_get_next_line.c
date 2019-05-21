/*
** EPITECH PROJECT, 2019
** Any project
** File description:
** Template for criterion unit test.
*/

#include <criterion/criterion.h>
#include <criterion/redirect.h>
#include "get_next_line.h"

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
    char *line = "Hello ";
    char *buffer = "World!";
    char *str_res = "Hello World!";
    int res = my_strcat(&line, &buffer);

    cr_assert_str_eq(line, str_res, "resultat = %s", line);
    cr_assert_eq(res, 0, "resultat = %d", res);
}

Test(fct, test_04)
{
    char *str1 = "Salut,";
    char *str2 = " ça";
    char *str3 = " va";
    char *str4 = " les amis ?";
    char *str_res = "Salut, ça va les amis ?";
    int res = my_strcat(&str1, &str2);

    cr_assert_str_eq(str1, "Salut, ça", "resultat = %s", str1);
    cr_assert_eq(res, 0, "resultat = %d", res);
    res = my_strcat(&str1, &str3);
    res = my_strcat(&str1, &str4);
    cr_assert_str_eq(str1, str_res, "resultat = %s", str1);
    cr_assert_eq(res, 0, "resultat = %d", res);
}

Test(fct, test_05)
{
    char *line = NULL;
    char *str1 = "Salut,";
    char *str2 = " ça";
    char *str3 = " va";
    char *str4 = " les amis ?";
    char *str_res = "Salut, ça va les amis ?";
    int res = my_strcat(&line, &str1);
    res = my_strcat(&line, &str2);
    res = my_strcat(&line, &str3);
    res = my_strcat(&line, &str4);
    cr_assert_str_eq(line, str_res, "resultat = %s", line);
    cr_assert_eq(res, 0, "resultat = %d", res);
}

Test(fct, test_06)
{
    char *line = NULL;
    char *str1 = "Salut,";
    char *str2 = " ça";
    char *str3 = " va";
    char *str4 = " les amis";
    char *str5 = " ?\nCoucou";
    char *str_res = "Salut, ça va les amis ?";
    int res = my_strcat(&line, &str1);

    res = my_strcat(&line, &str2);
    res = my_strcat(&line, &str3);
    res = my_strcat(&line, &str4);
    res = my_strcat(&line, &str5);
    cr_assert_str_eq(line, str_res, "resultat = %s", line);
    cr_assert_eq(res, 1, "resultat = %d", res);
}

Test(fct, test_07)
{
    char *buffer = NULL;
    char *line = NULL;
    int res = init_buffer(&line, &buffer);

    cr_assert_not_null(buffer, "resultat = %s", line);
    cr_assert_eq(res, 0, "Resultat = %d", res);
}
/*
Test(fct, test_08)
{
    cr_assert_eq(fct(A), R, "resultat = %d", R);
}

Test(fct, test_09)
{
    cr_assert_eq(fct(A), R, "resultat = %d", R);
}

Test(fct, test_10)
{
    cr_assert_eq(fct(A), R, "resultat = %d", R);
}

Test(fct, test_11)
{
    cr_assert_eq(fct(A), R, "resultat = %d", R);
}

Test(fct, test_12)
{
    cr_assert_eq(fct(A), R, "resultat = %d", R);
}

Test(fct, test_13)
{
    cr_assert_eq(fct(A), R, "resultat = %d", R);
}

Test(fct, test_14)
{
    cr_assert_eq(fct(A), R, "resultat = %d", R);
}

Test(fct, test_15)
{
    cr_assert_eq(fct(A), R, "resultat = %d", R);
}

Test(fct, test_16)
{
    cr_assert_eq(fct(A), R, "resultat = %d", R);
}

Test(fct, test_17)
{
    cr_assert_eq(fct(A), R, "resultat = %d", R);
}

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
