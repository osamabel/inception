# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: obelkhad <obelkhad@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/08 06:11:13 by obelkhad          #+#    #+#              #
#    Updated: 2023/02/11 22:07:44 by obelkhad         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# https://www.metricfire.com/blog/monitoring-docker-containers-with-cadvisor/
# -------------------------------- Base Image -------------------------------- #
FROM debian:buster
RUN apt-get update


# ----------------------------------- CURL ----------------------------------- #
RUN apt install -y wget

# ----------------------------- DOWNLOAD CADVISOR ---------------------------- #
RUN wget https://github.com/google/cadvisor/releases/download/v0.47.0/cadvisor-v0.47.0-linux-amd64
RUN mv cadvisor-v0.47.0-linux-amd64 cadvisor
RUN chmod +x cadvisor
RUN mv cadvisor /usr/bin/


# ----------------------------------- PORT ----------------------------------- #
EXPOSE 8181


# -------------------------------- foreground -------------------------------- #
ENTRYPOINT ["/usr/bin/cadvisor", "-logtostderr", "--port=8181"]
