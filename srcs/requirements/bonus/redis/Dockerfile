# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: obelkhad <obelkhad@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/13 07:01:45 by obelkhad          #+#    #+#              #
#    Updated: 2023/02/13 07:52:02 by obelkhad         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


# -------------------------------- Base Image -------------------------------- #
FROM debian:buster
RUN apt-get update


# ------------------------------- INSTALL RESID ------------------------------ #
RUN apt-get install -y redis-server php7.3-redis


# ----------------------------------- Config ---------------------------------- #
RUN sed -i "s/bind 127.0.0.1 ::1/bind 0.0.0.0/g" /etc/redis/redis.conf
RUN sed -i "s/# maxmemory <bytes>/maxmemory 256mb/g" /etc/redis/redis.conf
	

# -------------------------------- foreground -------------------------------- #
CMD ["redis-server", "--protected-mode", "no"]