# Use CentOS latest as the base image
FROM centos:latest

# Set metadata using LABEL
LABEL maintainer="vikashashoke@gmail.com"

# Install necessary packages
RUN yum install -y httpd zip unzip && \
    yum clean all

# Add the remote file to the html directory
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/

# Set the working directory
WORKDIR /var/www/html/

# Unzip the file and move its contents, then clean up
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Command to run the httpd server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose port 80
EXPOSE 80
