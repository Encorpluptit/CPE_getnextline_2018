/*
** EPITECH PROJECT, 2019
** Any project
** File description:
** Template for criterion unit test.
*/

#include <criterion/criterion.h>
#include <criterion/redirect.h>
#include "get_next_line.h"

#include <errno.h>
static int override_malloc;

void *__real_malloc(size_t);
void *__wrap_malloc(size_t s) {
    if (override_malloc) {
        errno = ENOMEM;
        return NULL;
    }
    return __real_malloc(s);
}
/*
Test(fct, test_01)
{
    cr_assert_eq(fct(A), R, "resultat = %d", R);
}

Test(fct, test_02)
{
    cr_assert_eq(fct(A), R, "resultat = %d", R);
}

Test(fct, test_03)
{
    cr_assert_eq(fct(A), R, "resultat = %d", R);
}

Test(fct, test_04)
{
    cr_assert_eq(fct(A), R, "resultat = %d", R);
}

Test(fct, test_05)
{
    cr_assert_eq(fct(A), R, "resultat = %d", R);
}

Test(fct, test_06)
{
    cr_assert_eq(fct(A), R, "resultat = %d", R);
}

Test(fct, test_07)
{
    cr_assert_eq(fct(A), R, "resultat = %d", R);
}

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
