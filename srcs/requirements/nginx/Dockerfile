# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: obelkhad <obelkhad@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/30 13:56:31 by obelkhad          #+#    #+#              #
#    Updated: 2023/02/11 20:54:05 by obelkhad         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


# -------------------------------- Base Image -------------------------------- #
FROM debian:buster
RUN apt-get update


# ------------------------------- INSTALL NGINX ------------------------------ #
RUN apt-get install -y nginx


# -------------------------------- INSTALL SSL ------------------------------- #
RUN apt-get install openssl 


# ------------------------ Create the SSL Certificate ------------------------- #
RUN openssl req -x509 -newkey rsa:2048 -days 365 -nodes\
    -out /etc/nginx/obelkhad.crt\
	-keyout /etc/nginx/obelkhad.key\
	-subj '/C=MA/ST=CASA/L=CASA/O=1337 School/OU=obelkhad/CN=obelkahd/'


# --------------------------- Server Configuration ---------------------------- #
COPY ./config/default /etc/nginx/sites-enabled


# ----------------------------------- PORTS ---------------------------------- #
EXPOSE 443


# -------------------------------- ENTRYPOINT -------------------------------- #
ENTRYPOINT ["nginx", "-g", "daemon off;"] 