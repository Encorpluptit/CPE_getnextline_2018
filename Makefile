##
## EPITECH PROJECT, 2019
## Makefile
## File description:
## Generic Makefile.
##


# Display variables.
#################
BRANCH_COV	=	"[--- BRANCHES COVERAGE ---]"
BC_FRAME	=	"[-------------------------]"
LINE_COV	=	"[--- LINES COVERAGE ---]"
LC_FRAME	=	"[----------------------]"
MY_BIN		=	"<----- $(NAME) ----->"
#################


MAIN	=	main.c

SRC	=	get_next_line.c	\

OBJ	=	$(SRC:.c=.o)

LIB_OBJ	=	$(LIB_SRC:.c=.o)

TESTS	=	tests/test_get_next_line.c	\

EXEC	=	get_next_line

CFLAGS	+=	-W -Wall -Wextra -Wshadow -std=c99 -pedantic -Werror

CPPFLAGS	=	-iquote .

TESTS_NAME	=	unit_tests

TESTS_FLAGS	=	--coverage -lcriterion

all:	$(EXEC)

$(EXEC):	$(OBJ)
	@gcc -o $(EXEC) $(MAIN) $(OBJ) $(CFLAGS) $(CPPFLAGS)

tests_run:
	@gcc $(SRC) $(TESTS) -o $(TESTS_NAME) $(TESTS_FLAGS) $(CPPFLAGS)
	@./$(TESTS_NAME)
	@echo -e "\e[1m\e[36m\n\t\t\t  $(LC_FRAME)"
	@echo -e "\t\t\t  $(LINE_COV)"
	@echo -e "\t\t\t  $(LC_FRAME)\e[0m"
	@mv test*.gc* tests
	@gcovr -r . -s --exclude='tests'
	@echo -e "\e[1m\e[36m\n\n\t\t\t  $(BC_FRAME)"
	@echo -e "\t\t\t  $(BRANCH_COV)"
	@echo -e "\t\t\t  $(BC_FRAME)\e[0m"
	@gcovr -b . -s --exclude='tests'
	@echo -e "------------ $(NAME) ------------"

clean:
	@rm -f $(OBJ)

tests_clean:
	@rm -f *.gcda
	@rm -f *.gcno
	@rm -f $(TESTS_NAME)

aclean:	clean tests_clean

fclean:	clean tests_clean
	@rm -f $(EXEC)

re:	fclean all

.PHONY:	all tests_run tests_clean aclean fclean re
