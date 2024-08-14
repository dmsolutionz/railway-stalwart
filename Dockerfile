FROM stalwartlabs/mail-server:latest

# Expose necessary ports
EXPOSE 443 8080 25 587 465 143 993 4190 110 995

# Set the working directory
WORKDIR /opt/stalwart-mail

# Add an echo command for logging
RUN echo "Stalwart Mail Server is being set up..."

# Use ENTRYPOINT with CMD to start the server correctly
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["echo 'Starting Stalwart Mail Server...' && stalwart-mail -c /var/lib/stalwart-mail/config.toml"]
