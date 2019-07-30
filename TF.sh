#!/bin/bash
ok=0
fail=0
prgm="get_next_line"

########################################TESTING FUNCTION########################################

function criterion() {
    make wrap_run
    #gcovr -r . -s --exclude='tests' >> coverage
    #cov= grep -roh "lines: [0-9][0-9]\.[0-9]%"
    #rm coverage
    #printf "$cov"
}

function test_error() {
    myvar=$1
    size=${#myvar}
    ./104intersection $2 $3 $4 $5 $6 $7 $8 $9 >> test1_correction
    variable=$?
    rm test1_correction
    printf "$variable" >> test1_correction
    diff $test test1_correction
    variable=$?
    if [ $variable -eq 0 ]
    then
        print_ok $size
        let ok="ok + 1"
    elif [ $variable -eq 1 ]
    then
        print_fail $size
        let fail="fail + 1"
    else
        print_ko $size
        let fail="fail + 1"
    fi
    rm test1_correction
}

function test_prgm() {
    myvar=$1
    size=${#myvar}
    ./$prgm $2 >> tests/test_fctnl
    diff $test tests/test_fctnl
    variable=$?
    if [ $variable -eq 0 ]
    then
        print_ok $size
        let ok="ok + 1"
    elif [ $variable -eq 1 ]
    then
        print_fail $size
        let fail="fail + 1"
    else
        print_ko $size
        let fail="fail + 1"
    fi
    rm tests/test_fctnl
}

function test_read() {
    myvar=$1
    size=${#myvar}
    ./$prgm $2 >> tests/test_fctnl
    diff $test tests/test_fctnl
    variable=$?
    if [ $variable -eq 0 ]
    then
        print_ok $size
        let ok="ok + 1"
    elif [ $variable -eq 1 ]
    then
        print_fail $size
        let fail="fail + 1"
    else
        print_ko $size
        let fail="fail + 1"
    fi
    rm tests/test_fctnl
}

#########################################PRINT FUNCTION##########################################

function print_ko() {
    for ((i=0; i < ($(tput cols) - ($1 - $1%2)) / 2; i++))
    do printf " "
    done
    printf "⎢"
    for ((i=9; i < $1 / 2; i++))
    do printf " "
    done
    printf "\033[1;31mERROR FILE NOT FOUND\033[0m"
    for ((i=9; i < $1 / 2; i++))
    do printf " "
    done
    let size2=$1%2
    if [ $size2 -eq 1 ]
    then
        printf " "
    fi
    printf "⎟"
}

function print_fail() {
    for ((i=0; i < ($(tput cols) - ($1 - $1%2)) / 2; i++))
    do printf " "
    done
    printf "⎢"
    for ((i=4; i < $1 / 2; i++))
    do printf " "
    done
    printf "\033[1;31mTEST FAILED\033[0m"
    for ((i=5; i < $1 / 2; i++))
    do printf " "
    done
    let size2=$1%2
    if [ $size2 -eq 1 ]
    then
        printf " "
    fi
    printf "⎟"

}

function print_ok() {
    for ((i=0; i < ($(tput cols) - ($1 - $1%2)) / 2; i++))
    do printf " "
    done
    printf "⎢"
    for ((i=2; i < ($1 / 2); i++))
    do printf " "
    done
    printf "\033[1;32mTEST OK\033[0m"
    for ((i=3; i < ($1 / 2); i++))
    do printf " "
        done
    let size2=$1%2
    if [ $size2 -eq 1 ]
    then
        printf " "
    fi
    printf "⎟"
}

function print_start() {
    myvar=$1
    size=${#myvar}
    for ((i=0; i < ($(tput cols) - ($size - $size%2)) / 2; i++))
    do printf " "
    done
    printf "⎡"
    for ((i=-2; i < $size; i++))
    do printf "⎺"
    done
    echo "⎤"
    for ((i=0; i < ($(tput cols) - ($size - $size%2)) / 2; i++))
    do printf " "
    done
    echo "⎢ $1 ⎟"
    for ((i=0; i < ($(tput cols) - ($size - $size%2)) / 2; i++))
    do printf " "
    done
    printf "⎢"
    for ((i=-2; i < $size; i++))
    do printf " "
    done
    printf "⎟"
    echo
}

function print_end() {
    myvar=$1
    size=${#myvar}
    echo
    for ((i=0; i < ($(tput cols) - ($size - $size%2)) / 2; i++))
    do printf " "
    done
    printf "⎣"
    for ((i=-2; i < $size; i++))
    do printf "_"
    done
    printf "⎦"
    echo -e "\n\n"

}

##############################################TESTS##############################################

make re > /dev/null

test="tests/ressources/test_ez"
print_start "TEST 1 : TEST_EZ"
test_prgm "TEST 1 : TEST_EZ" $test
print_end "TEST 1 : TEST_EZ"

test="include/get_next_line.h"
print_start "TEST 2 : GET_NEXT_LINE.H"
test_prgm "TEST 2 : GET_NEXT_LINE.H" $test
print_end "TEST 2 : GET_NEXT_LINE.H"

test="src/get_next_line.c"
print_start "TEST 3 : GET_NEXT_LINE.C"
test_prgm "TEST 3 : GET_NEXT_LINE.C" $test
print_end "TEST 3 : GET_NEXT_LINE.C"

test="tests/ressources/test_small"
print_start "TEST 4 : TEST_SMALL"
test_prgm "TEST 4 : TEST_SMALL" $test
print_end "TEST 4 : TEST_SMALL"

test="tests/src/test_get_next_line.c"
print_start "TEST 5 : TEST_GET_NEXT_LINE.C"
test_prgm "TEST 5 : TEST_GET_NEXT_LINE.C" $test
print_end "TEST 5 : TEST_GET_NEXT_LINE.C"

test="Makefile"
print_start "TEST 6 : MAKEFILE"
test_prgm "TEST 6 : MAKEFILE" $test
print_end "TEST 6 : MAKEFILE"

test="tests/ressources/test_text"
print_start "TEST 7 : TEST_TEXT"
test_prgm "TEST 7 : TEST_TEXT" $test
print_end "TEST 7 : TEST_TEXT"

print_start "TEST WITH READ_SIZE 5"
print_end "TEST WITH READ_SIZE 5"
CFLAGS+=-DREAD_SIZE=5 make re > /dev/null

test="tests/ressources/test_text"
print_start "TEST 8 : TEST_TEXT"
test_prgm "TEST 8 : TEST_TEXT" $test
print_end "TEST 8 : TEST_TEXT"

test="include/get_next_line.h"
print_start "TEST 9 : TEST_TEXT"
test_prgm "TEST 9 : TEST_TEXT" $test
print_end "TEST 9 : TEST_TEXT"

test="src/get_next_line.c"
print_start "TEST 10 : GET_NEXT_LINE.C"
test_prgm "TEST 10 : GET_NEXT_LINE.C" $test
print_end "TEST 10 : GET_NEXT_LINE.C"

test="tests/ressources/test_small"
print_start "TEST 11 : TEST_SMALL"
test_prgm "TEST 11 : TEST_SMALL" $test
print_end "TEST 11 : TEST_SMALL"

test="tests/src/test_get_next_line.c"
print_start "TEST 12 : TEST_GET_NEXT_LINE.C"
test_prgm "TEST 12 : TEST_GET_NEXT_LINE.C" $test
print_end "TEST 12 : TEST_GET_NEXT_LINE.C"

print_start "TEST WITH READ_SIZE 1"
print_end "TEST WITH READ_SIZE 1"
CFLAGS+=-DREAD_SIZE=1 make re > /dev/null

test="tests/ressources/test_text"
print_start "TEST 13 : TEST_TEXT"
test_prgm "TEST 13 : TEST_TEXT" $test
print_end "TEST 13 : TEST_TEXT"

test="include/get_next_line.h"
print_start "TEST 14 : TEST_TEXT"
test_prgm "TEST 14 : TEST_TEXT" $test
print_end "TEST 14 : TEST_TEXT"

test="src/get_next_line.c"
print_start "TEST 15 : GET_NEXT_LINE.C"
test_prgm "TEST 15 : GET_NEXT_LINE.C" $test
print_end "TEST 15 : GET_NEXT_LINE.C"

test="tests/ressources/test_small"
print_start "TEST 16 : TEST_SMALL"
test_prgm "TEST 16 : TEST_SMALL" $test
print_end "TEST 16 : TEST_SMALL"

test="tests/src/test_get_next_line.c"
print_start "TEST 17 : TEST_GET_NEXT_LINE.C"
test_prgm "TEST 17 : TEST_GET_NEXT_LINE.C" $test
print_end "TEST 17 : TEST_GET_NEXT_LINE.C"

print_start "TEST WITH READ_SIZE 50"
print_end "TEST WITH READ_SIZE 50"
CFLAGS+=-DREAD_SIZE=50 make re > /dev/null

test="tests/ressources/test_text"
print_start "TEST 18 : TEST_TEXT"
test_prgm "TEST 18 : TEST_TEXT" $test
print_end "TEST 18 : TEST_TEXT"

test="include/get_next_line.h"
print_start "TEST 19 : TEST_TEXT"
test_prgm "TEST 19 : TEST_TEXT" $test
print_end "TEST 19 : TEST_TEXT"

test="src/get_next_line.c"
print_start "TEST 20 : GET_NEXT_LINE.C"
test_prgm "TEST 20 : GET_NEXT_LINE.C" $test
print_end "TEST 20 : GET_NEXT_LINE.C"

test="tests/ressources/test_small"
print_start "TEST 21 : TEST_SMALL"
test_prgm "TEST 21 : TEST_SMALL" $test
print_end "TEST 21 : TEST_SMALL"

test="tests/src/test_get_next_line.c"
print_start "TEST 22 : TEST_GET_NEXT_LINE.C"
test_prgm "TEST 22 : TEST_GET_NEXT_LINE.C" $test
print_end "TEST 22 : TEST_GET_NEXT_LINE.C"

print_start "TEST WITH READ_SIZE 4096"
print_end "TEST WITH READ_SIZE 4096"
CFLAGS+=-DREAD_SIZE=4096 make re > /dev/null

test="tests/ressources/test_text"
print_start "TEST 23 : TEST_TEXT"
test_prgm "TEST 23 : TEST_TEXT" $test
print_end "TEST 23 : TEST_TEXT"

test="include/get_next_line.h"
print_start "TEST 24 : TEST_TEXT"
test_prgm "TEST 24 : TEST_TEXT" $test
print_end "TEST 24 : TEST_TEXT"

test="src/get_next_line.c"
print_start "TEST 25 : GET_NEXT_LINE.C"
test_prgm "TEST 25 : GET_NEXT_LINE.C" $test
print_end "TEST 25 : GET_NEXT_LINE.C"

test="tests/ressources/test_small"
print_start "TEST 26 : TEST_SMALL"
test_prgm "TEST 26 : TEST_SMALL" $test
print_end "TEST 26 : TEST_SMALL"

test="tests/src/test_get_next_line.c"
print_start "TEST 27 : TEST_GET_NEXT_LINE.C"
test_prgm "TEST 27 : TEST_GET_NEXT_LINE.C" $test
print_end "TEST 27 : TEST_GET_NEXT_LINE.C"

criterion
pytest ftests.py
make fclean > /dev/null
#test="include/get_next_line.h"
#print_start "TEST 2 : TEST_GET_NEXT_LINE.H"
#test_error "TEST 2 : TEST_GET_NEXT_LINE.H" get_next_line.h
#print_end "TEST 2 : TEST_GET_NEXT_LINE.Hn="


echo -e "TEST \033[1;32mPASSED\033[0m : $ok   TEST \033[1;31mFAILED\033[0m : $fail"
