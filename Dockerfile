FROM ubuntu:latest
RUN apt-get -y update
RUN apt-get install -y apache2 curl
RUN apt-get install -y zip
RUN apt-get install -y unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page278/freefolio.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip freefolio.zip
RUN cp -rvf freefolio/* .
RUN rm -rf freefolio freefolio.zip
ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]
EXPOSE 80
