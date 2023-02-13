# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: obelkhad <obelkhad@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/12 14:09:23 by obelkhad          #+#    #+#              #
#    Updated: 2023/02/13 07:58:11 by obelkhad         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


all: reload

create:
	@sudo mkdir -p ~/volume/wordpress
	@sudo mkdir -p ~/volume/maria
	@sudo mkdir -p ~/volume/portainer
	@sudo chmod 777 ~/volume/wordpress
	@echo "\e[32mVolume { Created } \e[0m"

down:
	@echo "\e[32mdocker compose { down } \e[0m"
	@sudo docker compose -f srcs/docker-compose.yml down
build:
	@echo "\e[32mdocker compose { build } \e[0m"
	@sudo docker compose -f srcs/docker-compose.yml build

up: create
	@echo "\e[32mdocker compose { up } \e[0m"
	@sudo docker compose -f srcs/docker-compose.yml up

start: create build up
	@echo "\e[32mdocker compose { start } \e[0m"

clean: down
	@sudo docker system prune -af
	@echo "\e[32mdocker compose { clean } \e[0m"

fclean: clean
	@sudo rm -rf  ~/volume
	@echo "\e[32mdocker compose { fclean } \e[0m"

re: fclean all