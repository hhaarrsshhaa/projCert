# Use an official Apache HTTP Server as the base image
FROM httpd:latest

# Create the target directory for the website content
RUN mkdir -p /root/cicd

# Copy the website content to the container
COPY website/ /root/cicd/

# Update Apache configuration to serve from the target directory
RUN sed -i 's#/usr/local/apache2/htdocs#/root/cicd#g' /usr/local/apache2/conf/httpd.conf

# Expose port 8080 to allow incoming HTTP traffic
EXPOSE 8080
