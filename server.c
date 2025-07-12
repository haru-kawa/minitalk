/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hakawamo <hakawamo@student.42tokyo.jp>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/09 14:06:57 by hakawamo          #+#    #+#             */
/*   Updated: 2025/06/11 20:59:46 by hakawamo         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	sig_handler(int sig, siginfo_t *info, void *context)
{
	static int				bit_count;
	static unsigned char	current_char;

	(void)context;
	if (sig == SIGUSR2)
		current_char = current_char + (1 << (7 - bit_count));
	bit_count++;
	kill(info->si_pid, SIGUSR1);
	if (bit_count == 8)
	{
		if (current_char == '\0')
			write(1, "\n", 1);
		else
			write(1, &current_char, 1);
		bit_count = 0;
		current_char = 0;
	}
}

void	ft_putnbr(int n)
{
	char	c;

	if (n >= 10)
		ft_putnbr(n / 10);
	c = '0' + (n % 10);
	write(1, &c, 1);
}

int	main(void)
{
	struct sigaction	s_action;

	s_action.sa_sigaction = sig_handler;
	s_action.sa_flags = SA_SIGINFO;
	sigemptyset(&s_action.sa_mask);
	sigaction(SIGUSR1, &s_action, NULL);
	sigaction(SIGUSR2, &s_action, NULL);
	write(1, "Server PID: ", 12);
	ft_putnbr(getpid());
	write(1, "\n", 1);
	while (1)
		pause();
	return (0);
}
