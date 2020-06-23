FROM devopsedu/webapp
  
RUN apt update -y && apt upgrade -y
RUN apt install -y apache2 curl git

WORKDIR /var/www/html

RUN git clone https://github.com/bhodow/edu_training.git

RUN mv edu_training/* . && rm -fr edu_training/ && mv apache2.conf /etc/apache2/apache2.conf

ENTRYPOINT ["apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80
