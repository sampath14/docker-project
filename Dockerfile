FROM ubuntu:latest
RUN apt-get -y update
RUN apt-get install -y apache2 curl
RUN apt-get install -y zip
RUN apt-get install -y unzip
ADD https://html5up.net/ethereal/download/html5up-paradigm-shift.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip html5up-paradigm-shift.zip
RUN cp -rvf html15/* .
RUN rm -rf html5up-paradigm-shift html5up-paradigm-shift.zip
ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]
EXPOSE 80
