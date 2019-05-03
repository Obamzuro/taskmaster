# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: obamzuro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/05/03 12:49:42 by obamzuro          #+#    #+#              #
#    Updated: 2019/05/03 12:59:13 by obamzuro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = taskmaster

SRCNAME = main.c

FLAGS = -g -Wall -Wextra -Werror

SRC = $(addprefix src/, $(SRCNAME))

OBJ = $(SRC:.c=.o)

HDRDIR = inc\
		 libft/include\
		 ftprintf/include

HDR = inc/taskmaster.h

all: lib $(NAME)

$(NAME): $(OBJ) libft/libft.a ftprintf/libftprintf.a
	gcc $(FLAGS) $(addprefix -I, $(HDRDIR)) $(OBJ) -L libft -lft -L ftprintf -lftprintf -ltermcap -o $(NAME)

%.o: %.c $(HDR)
	gcc $(FLAGS) $(addprefix -I, $(HDRDIR)) -c $< -o $@

lib:
	make -C libft
	make -C ftprintf

clean:
	make -C libft clean
	make -C ftprintf clean
	find . -name "*.o" -o -name ".*.sw[pon]" -exec rm -rf {} \;
	rm -rf $(OBJ)

fclean: clean
	make -C libft fclean
	make -C ftprintf fclean
	rm -rf $(NAME)

re: fclean all
