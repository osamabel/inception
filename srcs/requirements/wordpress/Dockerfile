# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: obelkhad <obelkhad@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/27 10:55:55 by obelkhad          #+#    #+#              #
#    Updated: 2023/02/01 09:18:36 by obelkhad         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


# -------------------------------- Base Image -------------------------------- #
FROM debian:buster
RUN apt-get update

# ---------------------------- PHP & PHP Extention --------------------------- #
RUN apt-get -y install php7.3 php7.3-fpm php7.3-mysqli

# -------------------------------- PHP CONFIG -------------------------------- #
COPY ./tools/* /tmp
RUN chmod +x /tmp/wordpress.sh
RUN mkdir /run/php
RUN chown -R www-data:www-data /run/php
COPY ./config/www.conf /etc/php/7.3/fpm/pool.d/

# ----------------------------------- PORTS ---------------------------------- #
EXPOSE 9000

# ------------------------------- Wordpress cli ------------------------------ #
RUN apt-get -y install wget

ENTRYPOINT [ "/tmp/wordpress.sh" ]

