# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: obelkhad <obelkhad@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/28 08:49:47 by obelkhad          #+#    #+#              #
#    Updated: 2023/02/11 21:49:50 by obelkhad         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


# -------------------------------- Base Image -------------------------------- #
FROM debian:buster
RUN apt-get update


# ----------------------------------- ARGS ----------------------------------- #
ARG DATA_NAME
ARG USER_NAME
ARG USER_PASSWORD
ARG ROOT_PASSWORD


# ---------------------------------- MariaDB --------------------------------- #
RUN apt-get install -y mariadb-server


# ---------------------------------- CONFIG ---------------------------------- #
RUN sed -i 's/bind-address.*=.*127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/mariadb.sh /tmp/
RUN chmod +x /tmp/mariadb.sh


# ----------------------------------- PORT ----------------------------------- #
EXPOSE 3306


# ---------------------------------- SCRIPT ---------------------------------- #
RUN /tmp/mariadb.sh


# -------------------------------- foreground -------------------------------- #
CMD ["mysqld"]