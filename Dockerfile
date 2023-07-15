# Use an official Apache HTTP Server as the base image
FROM httpd:latest

# Set the working directory to /root/cicd
WORKDIR /root/cicd

# Copy the website content to the container
COPY website/ .

# Update Apache configuration to serve from the target directory and set index.php as the default document
RUN sed -i 's#/usr/local/apache2/htdocs#/root/cicd#g' /usr/local/apache2/conf/httpd.conf && \
    echo "DirectoryIndex index.php" >> /usr/local/apache2/conf/httpd.conf

# Expose port 8080 to allow incoming HTTP traffic
EXPOSE 8080
