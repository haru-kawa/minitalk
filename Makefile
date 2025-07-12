# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hakawamo <hakawamo@student.42tokyo.jp>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/06/09 14:06:52 by hakawamo          #+#    #+#              #
#    Updated: 2025/06/11 18:51:04 by hakawamo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME1			= client
NAME2			= server
NAME			= $(NAME1) $(NAME2)

BONUS1			= client_bonus
BONUS2			= server_bonus
BONUS			= $(BONUS1) $(BONUS2)

CC				= cc
CFLAGS			= -Wall -Wextra -Werror -I.
RM				= rm -f

SRCS1			= client.c
SRCS2			= server.c
BONUSSRCS1		= client_bonus.c
BONUSSRCS2		= server_bonus.c

OBJS1			= $(SRCS1:.c=.o)
OBJS2			= $(SRCS2:.c=.o)
BONUSOBJS1		= $(BONUSSRCS1:.c=.o)
BONUSOBJS2		= $(BONUSSRCS2:.c=.o)

all:			$(NAME)

$(NAME1):		$(OBJS1)
				$(CC) $(CFLAGS) -o $(NAME1) $(OBJS1)

$(NAME2):		$(OBJS2)
				$(CC) $(CFLAGS) -o $(NAME2) $(OBJS2)

$(BONUS1):		$(BONUSOBJS1)
				$(CC) $(CFLAGS) -o $(BONUS1) $(BONUSOBJS1)

$(BONUS2):		$(BONUSOBJS2)
				$(CC) $(CFLAGS) -o $(BONUS2) $(BONUSOBJS2)

bonus:			$(BONUS)

clean:
				$(RM) $(OBJS1) $(OBJS2) $(BONUSOBJS1) $(BONUSOBJS2)

fclean:			clean
				$(RM) $(NAME) $(BONUS)

re:				fclean all

.PHONY:			all bonus clean fclean re