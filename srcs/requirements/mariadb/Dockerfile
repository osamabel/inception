# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: obelkhad <obelkhad@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/28 08:49:47 by obelkhad          #+#    #+#              #
#    Updated: 2023/02/01 15:40:27 by obelkhad         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# -------------------------------- Base Image -------------------------------- #
FROM debian:buster
RUN apt-get update && apt-get upgrade -y

# ENVDATA_NAME docker
# ENVUSER_NAME obelkhad
# ENVUSER_PASSWORD obelkhad_passwd
# ENVROOT_PASSWORD root_passwd

# ---------------------------------- MariaDB --------------------------------- #
RUN apt install -y mariadb-server

# ---------------------------------- CONFIG ---------------------------------- #
COPY ./tools/* /tmp/
RUN chmod +x /tmp/mariadb.sh
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql /var/run/mysqld
COPY ./config/50-server.cnf /etc/mysql/mariadb.conf.d/

# ----------------------------------- PORT ----------------------------------- #
EXPOSE 3306

# -------------------------------- ENTRYPOINT -------------------------------- #
RUN /tmp/mariadb.sh

CMD ["mysqld"]