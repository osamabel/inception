# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: obelkhad <obelkhad@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/13 05:57:18 by obelkhad          #+#    #+#              #
#    Updated: 2023/02/13 10:37:24 by obelkhad         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# https://docs.portainer.io/start/install/server/docker/linux
# -------------------------------- Base Image -------------------------------- #
FROM debian:buster
RUN apt update


RUN apt install -y curl


RUN curl -L https://github.com/portainer/portainer/releases/download/2.16.2/portainer-2.16.2-linux-amd64.tar.gz -o /tmp/portainer-2.16.2-linux-amd64.tar.gz --silent 

RUN tar -xvf /tmp/portainer-2.16.2-linux-amd64.tar.gz -C /

RUN chmod +x /portainer/portainer

ENTRYPOINT [ "/portainer/portainer" ]