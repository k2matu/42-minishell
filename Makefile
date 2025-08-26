# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kale <kale@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/22 10:19:34 by emichels          #+#    #+#              #
#    Updated: 2025/08/26 11:30:57 by kale             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	:= minishell
CC		:= gcc -g
CFLAGS	:= -Wextra -Wall -Werror
HEADERS	:= -I./builtins/

UNAME_S := $(shell uname -s)
ARCH := $(shell uname -m)

ifeq ($(UNAME_S),Darwin)
    ifeq ($(ARCH),arm64)
        # macOS Apple Silicon (ARM64)
        READLINE_DIR := /opt/homebrew/opt/readline
    else
        # macOS Intel
        READLINE_DIR := /usr/local/opt/readline
    endif
    CFLAGS += -I$(READLINE_DIR)/include
    LIBS := -Llibft -lft -L$(READLINE_DIR)/lib -lreadline
else
    # Linux
    LIBS := -Llibft -lft -lreadline
endif

SRCS	:=	main.c \
			exec/child.c \
			exec/exec_error.c \
			exec/exec.c \
			exec/heredoc.c \
			exec/heredoc_utils.c \
			exec/fd_utils.c \
			exec/open_files.c \
			exec/pipex_utils.c \
			exec/pipex_utils2.c \
			exec/safe_func.c \
			parsing/add_space.c \
			parsing/expand_str.c \
			parsing/expand_str2.c \
			parsing/parsing_utils.c \
			parsing/parsing.c \
			parsing/quote_utils.c \
			parsing/split.c \
			parsing/trim_quote.c \
			parsing/validate_syntax.c \
			tokenize/tokenize.c \
			tokenize/list_utils.c \
			builtins/builtin_utils.c \
			builtins/builtin_utils2.c \
			builtins/builtin_utils3.c \
			builtins/builtins.c \
			builtins/builtins2.c \
			builtins/environment.c \
			builtins/error_handling.c \
			builtins/get_builtin_num.c \
			builtins/run_builtin.c \
			signals/signals.c \
			signals/set_signals.c \

OBJS	:= ${SRCS:.c=.o}

all: $(NAME)

%.o: %.c
	@$(CC) $(CFLAGS) -o $@ -c $< $(HEADERS)

$(NAME): $(OBJS)
	@echo "Compiling minishell..."
	@make -C libft
	@$(CC) $(CFLAGS) $(OBJS) $(LIBS) $(HEADERS) -o $(NAME)

clean:
	@echo "Cleaning object files..."
	@rm -rf $(OBJS)
	@make clean -C libft

fclean: clean
	@echo "Cleaning everything else..."
	@rm -rf $(NAME)
	@make fclean -C libft

re: fclean all

.PHONY: all, clean, fclean, re