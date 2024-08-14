FROM stalwartlabs/mail-server:latest

# Expose necessary ports
EXPOSE 443 8080 25 587 465 993 4190 110 995

# Set the working directory
WORKDIR /opt/stalwart-mail
