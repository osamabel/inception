# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: obelkhad <obelkhad@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/21 14:27:35 by obelkhad          #+#    #+#              #
#    Updated: 2023/01/21 20:02:50 by obelkhad         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# -------------------------------- Base Image -------------------------------- #
FROM debian:bullseye
RUN apt-get update

# ------------------------------- Istall nginx ------------------------------- #
RUN apt-get install nginx -y

# ------------------------------ Install openssl ----------------------------- #
RUN apt-get install openssl 

# ------------------------ Create the SSL Certificate ------------------------- #
RUN openssl req -x509 -newkey rsa:2048 -days 365 -nodes \
    -out /etc/nginx/obelkhad.crt \
    -keyout /etc/nginx/obelkhad.key \
    -subj "/C=MA/ST=CASA/L=CASA/O=1337 School/OU=obelkhad/CN=obelkahd/"

# --------------------------- Server Configuration ---------------------------- #
COPY ./config/default /etc/nginx/sites-enabled/default

# ------------------------------- Start server ------------------------------- #
ENTRYPOINT ["nginx", "-g", "daemon off;"]