FROM ubuntu 
ENV TZ=Asia/Jakarta
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update
RUN apt-get install -y apache2
RUN apt-get install -y libapache2-mod-php php php-common php-xml php-gd php-opcache php-mbstring php-tokenizer php-json php-bcmath php-zip unzip
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server
ENTRYPOINT service apache2 start && service mysql start && bash
RUN apt-get clean
