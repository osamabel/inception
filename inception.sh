
# ===================   NGINX  =================== #
mkdir -p srcs
echo "version: '3'
services:" >> srcs/docker-compose.yml
mkdir -p srcs/requirements
mkdir -p srcs/requirements/nginx
mkdir -p srcs/requirements/nginx/config
echo "
server {
    listen 443 ssl;
	listen [::]:443 ssl ;
    server_name obelkhad.42.fr;
    ssl_certificate                 /etc/nginx/obelkhad.crt;
    ssl_certificate_key             /etc/nginx/obelkhad.key;
    ssl_protocols                  TLSv1.3;
	
    root /var/www/html;
    index index.html index.htm index.nginx-debian.html;
    # location / {
    #     try_files $uri $uri/ =404;
    # }
}" > srcs/requirements/nginx/config/default

echo "
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
    -subj '/C=MA/ST=CASA/L=CASA/O=1337 School/OU=obelkhad/CN=obelkahd/'
# --------------------------- Server Configuration ---------------------------- #
COPY ./config/default /etc/nginx/sites-enabled/default
# ------------------------------- Start server ------------------------------- #
ENTRYPOINT [\"nginx\", \"-g\", \"daemon off;\"] 
" >  srcs/requirements/nginx/Dockerfile
# ======================================================== #

# ===================NGINX COMPOSE =================== #
echo "  nginx:
    build: requirements/nginx/
    ports:
      - 443:443
    container_name: nginx
    volume:
      - /home/$USER/Docker/srcs/requirements/nginx/config:/etc/nginx/sites-enabled
      - wordpress_data:/var/ww/html" >> srcs/docker-compose.yml
# ===================================================== #

# ==================== WORDPRESS ====================== #
mkdir -p srcs/requirements/wordpress
mkdir -p srcs/requirements/wordpress/config
echo "
# -------------------------------- Base Image -------------------------------- #
FROM debian:bullseye
RUN apt-get update
# ---------------------------- PHP & PHP Extention --------------------------- #
RUN apt-get -y install php7.3 php7.3-fpm php7.3-mysqli
# --------------------------------- Wordpress -------------------------------- #
RUN apt-get -y install wget
RUN wget https://wordpress.org/latest.zip
RUN unzip latest.zip && cd wordpress
" >  srcs/requirements/wordpress/Dockerfile

echo "
" >  srcs/requirements/wordpress/config/php-fmp.conf

echo "
" >  srcs/requirements/wordpress/config/www.conf
# ===================================================== #