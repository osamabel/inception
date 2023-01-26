
# ===================   INSTALL DOCKER  =================== #
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release
mkdir -p /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
# ======================================================== #

# ===================INSTALL COMPOSE =================== #

sudo apt-get update
sudo apt-get install docker-compose-plugin

DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.15.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

echo "alias docker-compose=\"$DOCKER_CONFIG/cli-plugins/docker-compose\"" > ~/.bash_aliases
# ===================================================== #

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
RUN apt-get -y install php7.4 php-fpm php-mysqli

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

cd srcs/