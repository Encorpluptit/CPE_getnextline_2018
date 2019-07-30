##
## EPITECH PROJECT, 2019
## Any Project.
## File description:
## Generic Makefile (MADE BY : damien.bernard@epitech.eu)
##



                              ##################################################
			      #						       #
			      #                                                #
			      #		    GENERAL ARCHITECTURE	       #
			      #                                                #
			      #                                                #
			      ##################################################



#=============================#
# ==  Project Description  == #
#=============================#
#############################################################################################################
PROJECT			=	Get_Next_Line
BIN_NAME		=	get_next_line
LIB_NAME		=	gnl
LIB_FLAG		=	lib
#LIB_USED		=	#-lm, lncurses
#############################################################################################################



#=============================#
# ==     Project Files     == #
#=============================#
#############################################################################################################
MAIN_FILE		= 	main.c

SRC_FILES		=	get_next_line.c

LIB_FILES		=	my_putstr.c

TESTS_FILES		=	test_get_next_line.c
####################
# WRAPED_MALLOC
N_MALLOC_FILE		=	wrap_norm_malloc.c

R_MALLOC_FILE		=	wrap_real_malloc.c
#############################################################################################################



#===================================#
# == Project Folder Architecture == #
#===================================#
#############################################################################################################
####################
# Setup PROJECT path.
#PROJECT_FOLDER		=	.
#PROJECT_DIR		=	$(addsuffix /, $(PROJECT_FOLDER))
####################
# Setup SRC directory architecture.
SRC_FOLDER		=	src
SRC_DIR			=	$(addprefix $(PROJECT_DIR), $(addsuffix /, $(SRC_FOLDER)))
####################
# Setup INCLUDE directory architecture.
INCLUDE_FOLDER		=	include
INCLUDE_DIR		=	$(addprefix $(PROJECT_DIR), $(addsuffix /, $(INCLUDE_FOLDER)))
####################
# Setup LIB directory architecture.
LIB_FOLDER		=	lib
LIB_DIR			=	$(addprefix $(PROJECT_DIR), $(addsuffix /, $(LIB_FOLDER)))
####################
# Setup TESTS directories architecture.
TESTS_FOLDER		=	tests
TESTS_SRC_FOLDER	=	src
TESTS_INCLUDE_FOLDER	=	include
TESTS_RESSOURCES_FOLDER	=	ressources
TESTS_DIR		=	$(addprefix $(PROJECT_DIR), $(addsuffix /, $(TESTS_FOLDER)))
TESTS_SRC_DIR		=	$(addprefix $(TESTS_DIR), $(addsuffix /, $(TESTS_SRC_FOLDER)))
TESTS_INCLUDE_DIR	=	$(addprefix $(TESTS_DIR), $(addsuffix /, $(TESTS_INCLUDE_FOLDER)))
####################
# Setup WRAPED_MALLOC_ TESTS file.
TESTS_WRAP_FOLDER	=	$(addprefix $(TESTS_DIR), $(addsuffix /, $(TESTS_RESSOURCES_FOLDER)))
TESTS_WRAP_REAL		=	$(addprefix $(TESTS_WRAP_FOLDER), $(R_MALLOC_FILE))
TESTS_WRAP_NORM		=	$(addprefix $(TESTS_WRAP_FOLDER), $(N_MALLOC_FILE))
#############################################################################################################



#===================================#
# == Project Files Architecture  == #
#===================================#
#############################################################################################################
####################
# Setup rule to transform LIB_SRC_FILES into OBJ.
MAIN			:=	$(MAIN_FILE:.c=.o)
####################
# Setup SRC_FILES path.
SRC			:=	$(addprefix $(SRC_DIR), $(SRC_FILES))
####################
# Setup rule to transform SRC into OBJ.
OBJ			:=	$(SRC:.c=.o)
####################
# Setup LIB_SRC_FILES path.
LIB_SRC			:=	$(addprefix $(LIB_DIR), $(LIB_FILES))
####################
# Setup rule to transform LIB_SRC_FILES into OBJ.
LIB_OBJ			:=	$(LIB_SRC:.c=.o)
####################
# Setup LIB name with the lib tag (ex: libmy.a).
LDNAME			:=	$(addprefix $(LIB_FLAG), $(addsuffix .a, $(LIB_NAME)))
####################
# Setup LIB path.
LD_LIB			:=	$(addprefix $(LIB_DIR), $(LDNAME))
####################
# Setup TESTS_SRC_FILES path.
TESTS_SRC		:= 	$(addprefix $(TESTS_SRC_DIR), $(TESTS_FILES))
####################
# Setup rule to transform LIB_SRC_FILES into OBJ.
TESTS_OBJ		:=	$(TESTS_SRC:.c=.o)
#############################################################################################################










                              ##################################################
			      #						       #
			      #                                                #
			      #		    	   ESSENTIALS		       #
			      #                                                #
			      #                                                #
			      ##################################################





#=============================#
# ==     FUNDAMENTALS      == #
#=============================#
#############################################################################################################
####################
# Setup UNIT_TESTS RULE name and UNIT_TESTS binary name.
UTESTS_RUN		=	tests_run
TESTS_BIN		=	unit_tests
####################
# Setup WRAP_MALLOC RULE.
WRAP_MALLOC_RUN		=	wrap_run
####################
# Setup FUNCTIONNALS_TESTS RULE name and FUNCTIONNALS_TESTS script name.
#FTESTS_RUN		=	ftests_run
#FTESTS_BIN		=	ftests
####################
# Setup GDB and VALGRIND RULE.
GDB			=	gdb_run
VALGRIND		=	val_run
####################
# Setup UTILS commands.
SHELL			=	/bin/sh
MAKE			=	make --silent -C
RM			=	rm -f
CP			=	cp -t
MV			=	mv -t
GCOV			=	gcovr
CC			=	gcc
#CC			=	clang
LD			=	ar rc
#############################################################################################################





#===================================#
# == Custom Compilation Settings == #
#===================================#
#############################################################################################################
####################
# Setup define in compilation settings (ex: -DREAD_SIZE=5 || -D_WRAP_MALLOC_).
DEFINE			+=	#if define necessary
####################
# Setup includes flags.
INCLUDES		=	-iquote $(INCLUDE_DIR)
TESTS_INCLUDES		=	-iquote $(TESTS_INCLUDE_DIR)
####################
# Setup CFLAGS and CPPFLAGS, variables used in compilation commands.
CFLAGS			+=	$(DEFINE)
CPPFLAGS		+=	$(INCLUDES)
####################
# Setup GCCFLAGS and CLANGFLAGS, and assert the compiler used.
GCCFLAGS		+=	-W -Wall -Wextra -Wshadow
#GCCFLAGS		+=	-Werror
CLANGFLAGS		+=	-Weverything
ifeq ($(CC), clang)
    $(info <===== $(PROJECT) Makefile config: Using CLANG compiler =====>)
    CFLAGS += $(CLANGFLAGS)
else
    $(info <===== $(PROJECT) Makefile config: Using DEFAULT compiler [$(CC)] =====>)
    CFLAGS += $(GCCFLAGS)
endif
####################
# Setup LIB flags to compile with correct lib.
LDFLAGS			+=	-L$(LIB_FOLDER) -l$(LIB_NAME)
LDLIBS			+=	$(LIB_USED)
####################
# Setup VALGRIND flags to launch with valgrind.
VAL_FLAG		+=	-g3
####################
# Setup VALGRIND flags to launch with GDB
GDB_FLAG		+=	-g
#############################################################################################################




#=============================#
# ==  Tests Configuration  == #
#=============================#
#############################################################################################################
####################
# Setup TESTS flags for TESTS Rules.
#TESTS_DEFINE		+=	-D_TESTS_RUN_
TESTS_LDLIBS		+=	-lcriterion
TESTS_FLAGS		+=	--coverage
TFLAGS			+=	$(TESTS_DEFINE) $(TESTS_LDLIBS) $(TESTS_FLAGS)
####################
# Setup WRAP_MALLOC.
# Uncomment WRAP TO USE
NORM_WRAP		=	TRUE
REAL_WRAP		=	FALSE
WR_MALLOC   		=	-Wl,--wrap=malloc
WN_MALLOC   		=	-DWRAP
WRAPPERS		=
ifeq ($(NORM_WRAP), TRUE)
    WRAPPERS		+=	$(WN_MALLOC)
    TESTS_WRAP_SRC	+=	$(TESTS_WRAP_NORM)
    $(info <===== $(PROJECT) Makefile config: Using NORM_WRAP  =====>)
    $(info <===== $(PROJECT) WRAP_FLAGS = $(WN_MALLOC) =====> )
    $(info <===== $(PROJECT) WRAP_FILE = $(TESTS_WRAP_SRC) =====> )
endif
ifeq ($(REAL_WRAP), TRUE)
    WRAPPERS		+=	$(WR_MALLOC)
    TESTS_WRAP_SRC	+=	$(TESTS_WRAP_REAL)
    $(info <===== $(PROJECT) Makefile config: Using REAL_WRAP  =====>)
    $(info <===== $(PROJECT) WRAP_FLAGS = $(WR_MALLOC) =====> )
    $(info <===== $(PROJECT) WRAP_FILE = $(TESTS_WRAP_SRC) =====> )
endif
####################
# Setup FLAGS for execute Criterion binary.
TRUNFLAGS   +=	-S
TRUNFLAGS   +=	--timeout 5
TRUNFLAGS   +=	--always-succeed
####################
# Setup GCOVR FLAGS to exclude some dirextories.
GCOV_EXCLUDE		=	tests|lib
GCOVFLAGS		+=	-s --exclude='$(GCOV_EXCLUDE)'
#############################################################################################################




#=============================#
# ==   Display Variables   == #
#=============================#
#############################################################################################################
####################
# Setup gcovr frame display.
BRANCH_COV		=	"[--- BRANCHES COVERAGE ---]"
BC_FRAME		=	"[-------------------------]"
LINE_COV		=	"[--- LINES COVERAGE ---]"
LC_FRAME		=	"[----------------------]"
BIN_DISP		=	"<----- $(PROJECT) ----->"
####################
# Setup formating/color display.
END			=	"\e[0m"
BOLD			=	"\e[1m"
UL			=	"\e[4m"
BLINK			=	"\e[5m"
MAG			=	"\e[35m"
WARNING			=	"\e[1;31m"
FRAME			=	"<====================================================================>"
FRAME_W			=	$(WARNING)$(FRAME)$(END)
FRAME_D			=	"\e[94m"$(FRAME)$(END)
TASK_OK			=	"\e[1;4;92m"
RED_BG			=	"\e[1;4;41m"
GREEN_BG		=	"\e[1;4;42m"
TITLE			=	"\e[1;4;31m"
#############################################################################################################



			      ##################################################
			      #						       #
			      #                                                #
			      #		    	 MAKEFILE RULES		       #
			      #                                                #
			      #                                                #
			      ##################################################


					 #############################
					 #                           #
					 #	  Essentials	     #
					 #                           #
					 #############################

#=============================#
# ==     General Rules     == #
#=============================#
#############################################################################################################
####################
# Rule if no rule found in make command.
.DEFAULT := all

####################
# Rule for "make"
.PHONY: all
all: BUILD_LIB $(PROJECT)

####################
# Rule for "make re".
.PHONY: re
re: fclean all

####################
# Rule for changing VARIABLES in rule execution. (ex: CFLAGS += -g3)
%.o: CFLAGS += -MT $@ -MMD

####################
# Rule for transforming .c into .o
%.o: %.c
	@$(CC) $(CPPFLAGS) -c -o $@ $<
	@echo -e	$(MAG)"[$(PROJECT) | $(CC)] OK → $@"$(END)					| cat
#############################################################################################################




#=============================#
# ==     Binary Rules      == #
#=============================#
#############################################################################################################
.PHONY: $(PROJECT)
$(PROJECT): 		$(MAIN) $(OBJ)
	@echo -e	"\n\n"$(FRAME_D)								| cat
	@echo -e	$(TITLE)"[$(PROJECT)]: Building with following options (ordered):"$(END)	| cat
	@echo -e	"[$(PROJECT)]: CC        = $(CC)"						| cat
	@echo -e	"[$(PROJECT)]: SOURCES   = $(SRC)"						| cat
	@echo -e	"[$(PROJECT)]: OBJECTS   = $^"							| cat
	@echo -e	"[$(PROJECT)]: CFLAGS    = $(CFLAGS)"						| cat
	@echo -e	"[$(PROJECT)]: CPPFLAGS  = $(CPPFLAGS)"						| cat
	@echo -e	"[$(PROJECT)]: LDFLAGS   = $(LDFLAGS)"						| cat
	@echo -e	"[$(PROJECT)]: LDLIBS    = $(LDLIBS)"						| cat
	@$(CC) -o $(BIN_NAME) $^ $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(LDLIBS)
	@echo -e	$(TASK_OK)"[$(PROJECT) | Compilation] OK\n"$(FORMAT_END)			| cat
#############################################################################################################





#=============================#
# ==     Library Rules     == #
#=============================#
#############################################################################################################
.PHONY: BUILD_LIB
BUILD_LIB: 	$(LIB_OBJ)
	@echo -e	"\n\n"$(FRAME_D)								| cat
	@echo -e	$(TITLE)"[$(PROJECT)]: Library $(LIB_NAME) creation:"$(END)			| cat
	@-$(LD) $(LD_LIB) $(LIB_OBJ)
	@echo -e  	$(TASK_OK)"[$(PROJECT)]: Libraries created in $(LIB_FOLDER) folder !\n\n"$(END)	| cat





#############################################################################################################





#					 #############################
#					 #                           #
#					 #	  TESTS_RUN	     #
#					 #                           #
#					 #############################

#=============================#
# ==    Criterion Rule     == #
#=============================#
#############################################################################################################
.PHONY: $(UTESTS_RUN)
$(UTESTS_RUN):		CPPFLAGS	+=	$(TESTS_INCLUDES)
$(UTESTS_RUN):		fclean BUILD_LIB $(OBJ) $(TESTS_OBJ)
	@echo -e	"\n\n"$(FRAME_D)								| cat
	@echo -e	$(GREEN_BG)"[$(PROJECT)]: Testing project"$(END)				| cat
	@echo -e	$(FRAME_D)									| cat
	@echo -e	$(TITLE)"[$(PROJECT)]: Building with following options (ordered):"$(END)	| cat
	@echo -e	"[$(PROJECT)]: CC        = $(CC)"						| cat
	@echo -e	"[$(PROJECT)]: SRC       = $(SRC)"						| cat
	@echo -e	"[$(PROJECT)]: TESTS_SRC = $(TESTS_SRC)"					| cat
	@echo -e	"[$(PROJECT)]: CFLAGS    = $(CFLAGS)"						| cat
	@echo -e	"[$(PROJECT)]: CPPFLAGS  = $(CPPFLAGS)"						| cat
	@echo -e	"[$(PROJECT)]: LDFLAGS   = $(LDFLAGS)"						| cat
	@echo -e	"[$(PROJECT)]: LDLIBS    = $(LDLIBS)"						| cat
	@echo -e	"[$(PROJECT)]: TFLAGS    = $(TFLAGS)"						| cat
	@$(CC) -o $(TESTS_BIN) $(SRC) $(TESTS_SRC) $(CFLAGS) $(LDFLAGS) $(TFLAGS) $(CPPFLAGS) $(LDLIBS)
	@-$(MV) $(TESTS_DIR) test_*.gc*


	@echo -e	$(UL)"\n\n[$(PROJECT)]: Starting UNIT_TESTS binary."$(END)			| cat
	@echo -e	"[$(PROJECT)]: TRUNFLAGS  = $(TRUNFLAGS)\n"					| cat
	@-./$(TESTS_BIN) $(TRUNFLAGS)

	@echo -e	"\n\n[$(PROJECT)]: Moving test sources coverage files into $(TESTS_FOLDER)"	| cat
	@-$(MV) $(TESTS_DIR) test_*.gc*

	@echo -e	"[$(PROJECT)]: Gcovr Flags = $(GCOVFLAGS)"					| cat
	@echo -e	"\n\n"$(FRAME_D)								| cat
	@echo -e	$(RED_BG)"\t\t[$(PROJECT)]: Complete coverage report"$(END)			| cat
	@echo -e	"\e[1m\e[36m\n\t\t\t  $(LC_FRAME)"						| cat
	@echo -e	"\t\t\t  $(LINE_COV)"								| cat
	@-echo -e	"\t\t\t  $(LC_FRAME)\e[0m"							| cat
	@$(GCOV) -r . $(GCOVFLAGS)
	@echo -e	"\e[1m\e[36m\n\n\t\t\t  $(BC_FRAME)"						| cat
	@echo -e	"\t\t\t  $(BRANCH_COV)"								| cat
	@echo -e	"\t\t\t  $(BC_FRAME)\e[0m"							| cat
	@$(GCOV) -b . $(GCOVFLAGS)
	@echo -e	$(RED_BG)"\t\t  ------------ $(PROJECT) ------------  "$(END)			| cat
#############################################################################################################



#=============================#
# ==   Wrap_Malloc Rule    == #
#=============================#
#############################################################################################################
.PHONY: $(WRAP_MALLOC_RUN)
$(WRAP_MALLOC_RUN):		CPPFLAGS	+=	$(TESTS_INCLUDES)
$(WRAP_MALLOC_RUN):		fclean BUILD_LIB $(OBJ) $(TESTS_OBJ)
	@echo -e	"\n\n"$(FRAME_W)
	@echo -e	"\t\t\t"$(RED_BG)"USING MALLOC WRAPPERS !!!!"$(END)
	@echo -e	$(FRAME_W)"\n\n"
	@echo -e	"\n\n"$(FRAME_D)								| cat
	@echo -e	$(GREEN_BG)"[$(PROJECT)]: Testing project"$(END)				| cat
	@echo -e	$(FRAME_D)									| cat
	@echo -e	$(TITLE)"[$(PROJECT)]: Building with following options (ordered):"$(END)	| cat
	@echo -e	"[$(PROJECT)]: CC        = $(CC)"						| cat
	@echo -e	"[$(PROJECT)]: SRC       = $(SRC)"						| cat
	@echo -e	"[$(PROJECT)]: TESTS_SRC = $(TESTS_SRC)"					| cat
	@echo -e	"[$(PROJECT)]: CFLAGS    = $(CFLAGS)"						| cat
	@echo -e	"[$(PROJECT)]: CPPFLAGS  = $(CPPFLAGS)"						| cat
	@echo -e	"[$(PROJECT)]: LDFLAGS   = $(LDFLAGS)"						| cat
	@echo -e	"[$(PROJECT)]: LDLIBS    = $(LDLIBS)"						| cat
	@echo -e	"[$(PROJECT)]: TFLAGS    = $(TFLAGS)"						| cat


####################
# Launching unit tests without using wrapped malloc.
	@$(CC) -o $(TESTS_BIN) $(SRC) $(TESTS_SRC) $(CFLAGS) $(LDFLAGS) $(CPPFLAGS) $(TFLAGS) $(LDLIBS)
	@echo -e	$(UL)"\n\n[$(PROJECT)]: Starting UNIT_TESTS binary."$(END)			| cat
	@echo -e	"[$(PROJECT)]: TRUNFLAGS  = $(TRUNFLAGS)\n"					| cat
	@-./$(TESTS_BIN) $(TRUNFLAGS)
	@-rename .gcda _wrap.gcda *.gcda
	@-rename .gcno _wrap.gcno *.gcno
	@-$(RM)   $(TESTS_BIN)
	@echo -e	"\n\n[$(PROJECT)]: Moving test sources coverage files into $(TESTS_FOLDER)"	| cat
	@-$(MV) $(TESTS_DIR) test_*.gc*


####################
# Launching unit tests using wrapped malloc.
	@echo -e	$(TITLE)"\n\n\n[$(PROJECT)]: Wrapping malloc with : $(WRAPPERS)"$(END)		| cat
	@echo -e	"\n\n\n[$(PROJECT)]: Wrapping malloc with : $(TESTS_WRAP_SRC)"			| cat
	@$(CC) -o $(TESTS_BIN) $(SRC) $(TESTS_WRAP_SRC) $(WRAPPERS) $(LDFLAGS) $(CPPFLAGS) $(TFLAGS) $(LDLIBS)
	@echo -e	$(UL)"[$(PROJECT)]: Starting WRAPED UNIT_TESTS binary."$(END)		| cat
	@echo -e	"[$(PROJECT)]: TRUNFLAGS  = $(TRUNFLAGS)\n"					| cat
	@./$(TESTS_BIN) $(TRUNFLAGS)
	@echo -e	"\n\n[$(PROJECT)]: Moving wraped test sources coverage files into $(TESTS_FOLDER)"
	@-$(MV) $(TESTS_DIR) wrap_*.gc*


####################
# Launching gcovr report.
	@echo -e	"[$(PROJECT)]: Gcovr Flags = $(GCOVFLAGS)"					| cat
	@echo -e	"\n\n"$(FRAME_D)								| cat
	@echo -e	$(RED_BG)"\t\t[$(PROJECT)]: Complete coverage report"$(END)			| cat
	@echo -e	"\e[1m\e[36m\n\t\t\t  $(LC_FRAME)"						| cat
	@echo -e	"\t\t\t  $(LINE_COV)"								| cat
	@-echo -e	"\t\t\t  $(LC_FRAME)\e[0m"							| cat
	@$(GCOV) -r . $(GCOVFLAGS)
	@echo -e	"\e[1m\e[36m\n\n\t\t\t  $(BC_FRAME)"						| cat
	@echo -e	"\t\t\t  $(BRANCH_COV)"								| cat
	@echo -e	"\t\t\t  $(BC_FRAME)\e[0m"							| cat
	@$(GCOV) -b . $(GCOVFLAGS)
	@echo -e	$(RED_BG)"\t\t  ------------ $(PROJECT) ------------  "$(END)			| cat
#############################################################################################################

#=====================================#
# ==    FUNCTIONNALS TESTS  Rule   == #
#=====================================#
#############################################################################################################

#############################################################################################################


#					 #############################
#					 #                           #
#					 #	  DEBUG_RUN	     #
#					 #                           #
#					 #############################

#=============================#
# ==    Valgrind Rules     == #
#=============================#
#############################################################################################################
.PHONY: $(VALGRIND)
$(VALGRIND):		CFLAGS		+=	$(VAL_FLAG)
$(VALGRIND): 		$(MAIN) $(OBJ)
	@echo -e	"\n\n"$(FRAME_W)
	@echo -e	"\t\t\t"$(RED_BG)"USING VALGRIND MODE !!!!"$(END)
	@echo -e	$(FRAME_W)"\n\n"
	@echo -e	"\n\n"$(FRAME_D)								| cat
	@echo -e	$(TITLE)"[$(PROJECT)]: Building with following options (ordered):"$(END)	| cat
	@echo -e	"[$(PROJECT)]: CC        = $(CC)"						| cat
	@echo -e	"[$(PROJECT)]: SOURCES   = $(SRC)"						| cat
	@echo -e	"[$(PROJECT)]: OBJECTS   = $^"							| cat
	@echo -e	"[$(PROJECT)]: CFLAGS    = $(CFLAGS)"						| cat
	@echo -e	"[$(PROJECT)]: CPPFLAGS  = $(CPPFLAGS)"						| cat
	@echo -e	"[$(PROJECT)]: LDFLAGS   = $(LDFLAGS)"						| cat
	@echo -e	"[$(PROJECT)]: LDLIBS    = $(LDLIBS)"						| cat
	@$(CC) -o $(BIN_NAME) $^ $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(LDLIBS)
	@echo -e	$(TASK_OK)"[$(PROJECT) | Compilation] OK\n"$(FORMAT_END)			| cat
#############################################################################################################





#=============================#
# ==       GDB Rules       == #
#=============================#
#############################################################################################################
.PHONY: $(GDB)
$(GDB):			CFLAGS		+=	$(GDB_FLAG)
$(GDB): 		$(MAIN) $(OBJ)
	@echo -e	"\n\n"$(FRAME_W)
	@echo -e	"\t\t\t"$(RED_BG)"GDB MODE !!!!"$(END)
	@echo -e	$(FRAME_W)"\n\n"
	@echo -e	"\n\n"$(FRAME_D)								| cat
	@echo -e	$(TITLE)"[$(PROJECT)]: Building with following options (ordered):"$(END)	| cat
	@echo -e	"[$(PROJECT)]: CC        = $(CC)"						| cat
	@echo -e	"[$(PROJECT)]: SOURCES   = $(SRC)"						| cat
	@echo -e	"[$(PROJECT)]: OBJECTS   = $^"							| cat
	@echo -e	"[$(PROJECT)]: CFLAGS    = $(CFLAGS)"						| cat
	@echo -e	"[$(PROJECT)]: CPPFLAGS  = $(CPPFLAGS)"						| cat
	@echo -e	"[$(PROJECT)]: LDFLAGS   = $(LDFLAGS)"						| cat
	@echo -e	"[$(PROJECT)]: LDLIBS    = $(LDLIBS)"						| cat
	@$(CC) -o $(BIN_NAME) $^ $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(LDLIBS)
	@echo -e	"[$(PROJECT) | Compilation] OK\n"						| cat
#############################################################################################################










#					 #############################
#					 #                           #
#					 #	  CLEAN-UP	     #
#					 #                           #
#					 #############################


#===================================#
# ==  Object Files Cleanup Rule  == #
#===================================#
################################################################################
.PHONY: $(obj_clean)
obj_clean:
	@echo -e	"[$(PROJECT)]: Removing object files."						| cat
	@-$(RM)  $(OBJ) $(MAIN:.c=.o)
	@echo -e	"[$(PROJECT)]: Removing lib object files."					| cat
	@-$(RM)  $(LIB_OBJ)
	@echo -e	"[$(PROJECT)]: Removing tests object files (if any)."				| cat
	@-$(RM)  $(TESTS_SRC_DIR)/*.o
	@-$(RM)  *.o





#===================================#
# == Library Files Cleanup Rule  == #
#===================================#
################################################################################
.PHONY: $(lib_clean)
lib_clean:
	@echo -e	"[$(PROJECT)]: Removing library $(LIB_NAME) file."				| cat
	@-$(RM)  $(LD_LIB)





#===================================#
# ==  Tests Files Cleanup Rule   == #
#===================================#
################################################################################
.PHONY: $(tests_clean)
tests_clean:
	@echo -e	"[$(PROJECT)]: Removing coverage files."					| cat
	@-$(RM)  *.gc* $(TESTS_DIR)/*.gc*
	@-$(RM)  *.gc* $(LIB_DIR)/*.gc*
	@-$(RM)  *.gc* $(TESTS_DIR)/*.o

	@echo -e	"[$(PROJECT)]: Removing test binary."						| cat
	@-$(RM)   $(TESTS_BIN)





#===================================#
# ==     Aclean Cleanup Rule     == #
#===================================#
################################################################################
.PHONY: $(aclean)
aclean: obj_clean lib_clean tests_clean





#===================================#
# ==     Fclean Cleanup Rule     == #
#===================================#
################################################################################
.PHONY: $(fclean)
fclean: aclean
	@echo -e	"[$(PROJECT)]: Removing binary."						| cat
	@-$(RM)   $(BIN_NAME)
	@echo -e	$(TASK_OK)"\n[$(PROJECT)]: Project cleaned !"$(END)				| cat
	@echo -e	$(FRAME_D)"\n\n"





#############################################################################################################
