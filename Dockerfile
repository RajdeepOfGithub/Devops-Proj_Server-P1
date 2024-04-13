# Use Ubuntu latest as the base image
FROM ubuntu:latest

# Set metadata using LABEL
LABEL maintainer="rajdeeproy173@gmail.com"

# Install necessary packages
RUN apt-get update && \
    apt-get install -y apache2 zip unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add the remote file to the html directory
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/

# Set the working directory
WORKDIR /var/www/html/

# Unzip the file and move its contents, then clean up
RUN unzip photogenic.zip && \
    mv photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Command to run the Apache server
CMD ["apache2ctl", "-D", "FOREGROUND"]

# Expose port 80
EXPOSE 80
