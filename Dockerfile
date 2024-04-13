# Use CentOS Stream 8 for continued updates and support
FROM centos/stream8

LABEL maintainer="rajdeeproy173@gmail.com"

# Ensure the package manager is up to date and install necessary packages
RUN yum update -y && \
    yum install -y httpd zip unzip && \
    yum clean all

# Add a remote file directly to the intended directory
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/

# Set the working directory
WORKDIR /var/www/html/

# Unzip the downloaded file, organize files, and clean up unnecessary files
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Command to run the HTTP server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose the HTTP port and SSH port
EXPOSE 80 22
