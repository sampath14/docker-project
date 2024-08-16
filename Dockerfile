FROM ubuntu:latest
RUN apt-get -y update
RUN apt-get install -y apache2 curl
RUN apt-get install -y zip
RUN apt-get install -y unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page295/kider.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip kider.zip
RUN cp -rvf kider/* .
RUN rm -rf kider kider.zip
ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]
EXPOSE 80
