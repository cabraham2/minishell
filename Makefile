# **************************************************************************** #
#                                  Makefile                                    #
# **************************************************************************** #

NAME = minishell

SRCDIR = src
OBJDIR = .obj
INCDIR = includes

SRCS = src/main.c

OBJS = $(SRCS:src/%.c=$(OBJDIR)/%.o)

CC = gcc
CFLAGS = -Wall -Werror -Wextra -I $(INCDIR)

$(OBJDIR)/%.o: src/%.c | $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJDIR):
	mkdir -p $(OBJDIR)

$(NAME): $(OBJDIR) $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(NAME)

all: $(NAME)

clean:
	rm -rf $(OBJDIR)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
