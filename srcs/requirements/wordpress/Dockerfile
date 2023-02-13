# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: obelkhad <obelkhad@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/27 10:55:55 by obelkhad          #+#    #+#              #
#    Updated: 2023/02/11 20:51:27 by obelkhad         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


# -------------------------------- Base Image -------------------------------- #
FROM debian:buster
RUN apt-get update


# ---------------------------- PHP & PHP Extention --------------------------- #
RUN apt-get -y install php7.3 php7.3-fpm php7.3-mysqli


# -------------------------------- PHP CONFIG -------------------------------- #
RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
COPY ./tools/wordpress.sh /tmp
RUN chmod +x /tmp/wordpress.sh
RUN mkdir /run/php


# ----------------------------------- SITE ----------------------------------- #
COPY ./web /tmp/web



# ----------------------------------- PORTS ---------------------------------- #
EXPOSE 9000


# ------------------------------- Wordpress cli ------------------------------ #
RUN apt-get -y install wget


# ---------------------------------- SCRIPT ---------------------------------- #
ENTRYPOINT [ "/tmp/wordpress.sh" ]