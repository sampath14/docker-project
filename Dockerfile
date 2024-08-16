FROM ubuntu:latest

# Update package list and install necessary packages
RUN apt-get update && \
    apt-get install -y apache2 curl unzip

# Define the working directory
WORKDIR /var/www/html

# Download the zip file directly using curl
RUN curl -o freefolio.zip https://www.free-css.com/assets/files/free-css-templates/download/page278/freefolio.zip

# Unzip the downloaded file
RUN unzip freefolio.zip && \
    cp -rvf freefolio/* . && \
    rm -rf freefolio freefolio.zip

# Ensure Apache runs in the foreground
ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]

# Expose port 80
EXPOSE 80

