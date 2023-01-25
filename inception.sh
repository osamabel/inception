
apt-get update
apt-get install -y ca-certificates curl gnupg lsb-release
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

mkdir -p srcs
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
}" >> srcs/requirements/nginx/config/default

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
" >>  srcs/requirements/nginx/Dockerfile

