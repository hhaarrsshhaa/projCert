# Use Ubuntu as the base image
FROM ubuntu:latest

# Install PHP and Apache
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y php apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy website files to Apache root directory
COPY website/ /var/www/html/

# Remove default index.html from Apache root directory
RUN rm /var/www/html/index.html

# Expose port 80 to allow incoming HTTP traffic
EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]
