
## _Docker 101_
> Docker is a tool designed to make it easier to create, deploy, and run applications by using containers. <br> 
> Containers allow a developer to package up an application with all of the parts it needs, such as libraries and other dependencies

>---
> sources :<br>
[docs](https://docs.docker.com/)<br>
[docker 101](https://www.docker.com/101-tutorial/)<br>
[Docker Tutorial Series](https://rominirani.com/docker-tutorial-series-a7e6ff90a023)<br>
[Why Docker?](https://itnext.io/docker-101-fundamentals-the-dockerfile-b33b59d0f14b#:~:text=point%3A%20why%20Docker%3F-,Why%20Docker%3F,-I%20can%E2%80%99t%20tell)<br>
[medium](https://medium.com/free-code-camp/demystifying-containers-101-a-deep-dive-into-container-technology-for-beginners-d7b60d8511c1)<br>
[Kernel Space - PARTE I](https://medium.com/@saschagrunert/demystifying-containers-part-i-kernel-space-2c53d6979504)<br>
[Container Runtimes - PARTE II](https://medium.com/@saschagrunert/demystifying-containers-part-ii-container-runtimes-e363aa378f25)<br>
[Container Images - PARTE III](https://medium.com/@saschagrunert/demystifying-containers-part-iii-container-images-244865de6fef)<br>


>---
> Dokcerfile : <br>
`A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image.`<br>
`Using docker build users can create an automated build that executes several command-line instructions in succession.`<br>
[Dockerfile reference](https://docs.docker.com/engine/reference/builder/)<br>
[Best Practices for Writing a Dockerfile ](https://blog.bitsrc.io/best-practices-for-writing-a-dockerfile-68893706c3?source=search_post---------0----------------------------)<br>
[Docker 101: Fundamentals & The Dockerfile ](https://itnext.io/docker-101-fundamentals-the-dockerfile-b33b59d0f14b#:~:text=The%20Dockerfile%20%E2%80%94%20where%20it%20all%20begins)<br>

>---

> Docker Compose : <br>
`Is a tool for defining and running multi-container Docker applications.`<br>
`The docker-compose.yml allows you to configure all those services in one place and start them all with a single command.`<br>
[Docker compose](https://docs.docker.com/compose/)<br>
[Docker 102: Docker-Compose ](https://itnext.io/docker-102-docker-compose-6bec46f18a0e)<br>
[Install the Compose plugin](https://docs.docker.com/compose/install/linux/)<br>
[Try Docker Compose](https://docs.docker.com/compose/gettingstarted/)<br>

## _Nginx 101_
>[Understanding Nginx Server and Location Block Selection Algorithms](https://www.digitalocean.com/community/tutorials/understanding-nginx-server-and-location-block-selection-algorithms)<br>
[How To Create a Self-Signed SSL Certificate for Nginx in Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-16-04)<br>
[nginx](https://docs.nginx.com/nginx/admin-guide/basic-functionality/runtime-control/)<br>
[youtube](https://www.youtube.com/watch?v=dsTub1_4Upg)<br>
[medium 1](https://medium.com/tech-it-out/introduction-to-nginx-101-20b52e316f8/) ✨<br>
[medium 2](https://ashanpriyadarshana.medium.com/nginx-101-4687b28ae633) ✨<br>
[SSL & TLS](https://www.websecurity.digicert.com/security-topics/what-is-ssl-tls-https)<br>

> SSL how it works ?<br>
![alt text for screen readers](https://docs.oracle.com/cd/E19226-01/820-7627/images/security-sslBMAWithCertificates.gif).<br>

> Create ssl certificat :<br>
TLS/SSL works by using a combination of a `public certificate` and a `private key`.<br>
The `SSL key` is kept secret on the server: It is used to encrypt content sent to clients.<br>
`The SSL certificate` is publicly shared with anyone requesting the content :It can be used to decrypt the content signed by the associated SSL key.<br>

## _Wordpress :_
To run WordPress we recommend your host supports :
- [PHP](https://www.php.net/) version 7.4 or greater, [How to setup PHP on Nginx with fastCGI](https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/Nginx-PHP-FPM-config-example) & [PHP extentions](https://docs.php.earth/docker/php-extensions/). <br>
- [How to install PHP extensions on Linux](https://www.linkedin.com/pulse/how-install-php-extensions-linux-vladimir-lebedenko/)
- [Why Do You Need PHP FastCGI Process Manager?](https://www.plesk.com/blog/various/why-do-you-need-php-fpm/).<br>

> There are many `PHP extensions` available, some of the most common ones used in combination with nginx and mariadb are:
**PHP-FPM** :(an acronym of FastCGI Process Manager) is a hugely-popular alternative PHP (Hypertext Processor) FastCGI implementation.
-**MySQLi**: This extension provides an improved interface for working with MySQL databases.<br>
-**PDO**: PHP Data Objects is a database access abstraction layer that provides a unified API for working with different types of databases, including MariaDB.<br>
-**mbstring**: This extension provides multibyte string functions, which can be useful for processing text in languages that use non-Latin characters.<br>
-**curl**: This extension allows PHP to communicate with other servers using the cURL library, which is often used to transfer data over HTTP.<br>
-**json**: This extension provides functions for encoding and decoding JSON data, which is often used for exchanging data between web applications.<br>
-**gd**: This extension provides image processing capabilities, such as creating, opening, manipulating and saving image files.<br>
-**zip**: This extension provides support for handling ZIP compressed files.<br>
-**xml**: This extension provides functions for parsing and manipulating XML data.<br>

- [MySQL](https://www.mysql.com/) version 5.7 or greater OR [MariaDB](https://mariadb.org/) version 10.3 or greater. <br>
- [HTTPS](https://wordpress.org/news/2016/12/moving-toward-ssl/) support. <br>
- [Apache](https://httpd.apache.org/) or [Nginx](https://nginx.org/) as the most robust and featureful server for running WordPress. <br>
- `any server that supports PHP and MySQL will do`
>[How to install WordPress](https://wordpress.org/documentation/article/how-to-install-wordpress/)



