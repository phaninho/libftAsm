SRC_PATH = ./srcs/
OBJ_PATH = ./obj/
INC_PATH = ./inc/

SRC_NAME =	ft_bzero.s \
			ft_strcat.s \
			ft_isalpha.s \
			ft_isdigit.s \
			ft_isalnum.s \
			ft_isascii.s \
			ft_isprint.s \
			ft_toupper.s \
			ft_tolower.s \
			ft_puts.s \
			\
			ft_strlen.s \
			ft_memset.s \
			ft_memcpy.s \
			ft_strdup.s \
			\
			ft_cat.s \
			\
			ft_putstr.s \
			ft_putstr_len.s \
			ft_debug.s	\
			ft_strchr.s \
			ft_strchr_len.s \
			ft_memalloc.s

TEST_SRC_NAME = main.cpp
OBJ_NAME = $(SRC_NAME:.s=.o)
NAME = libfts.a
TEST_NAME = test

SRC = $(addprefix $(SRC_PATH),$(SRC_NAME))
OBJ = $(addprefix $(OBJ_PATH),$(OBJ_NAME))
INC = $(addprefix -I ,$(INC_PATH))

LIB = -L . -lfts

CC = g++
ASM = nasm

AFLAGS = -f macho64
CFLAGS = -MMD -Wall -Wextra -Werror

all:
	@echo "\033[32;44m Make $(NAME) \033[0m"
	@make $(NAME)

$(NAME): $(OBJ)
	ar rc $@ $^
	ranlib $@

$(OBJ_PATH)%.o: $(SRC_PATH)%.s
	@mkdir -p $(OBJ_PATH)
	$(ASM) $(AFLAGS) -o $@ $<

$(TEST_NAME): $(OBJ) $(TEST_SRC_NAME)
	$(CC) $(CFLAGS) $(INC) $(LIB) $(TEST_SRC_NAME) -o $@

run: all $(TEST_NAME)
	./$(TEST_NAME) lol

clean:
	@echo "\033[31;44m Make clean $(NAME) \033[0m"
	rm -rf $(OBJ_PATH)

fclean: clean
	@echo "\033[31;44m Make fclean $(NAME) \033[0m"
	rm -f $(NAME)
	rm -f $(TEST_NAME)
	rm -f $(TEST_NAME).d

re: fclean all

-include $(OBJ:.o=.d)

.PHONY: lib clean fclean re
