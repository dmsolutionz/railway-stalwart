FROM stalwartlabs/mail-server:latest

# Expose necessary ports
EXPOSE 443 8080 25 587 465 143 993 4190 110 995

# Set the working directory
WORKDIR /opt/stalwart-mail

# We don't need to create a configuration file manually anymore,
# as the image seems to handle this on first run

# Add an echo command for logging
RUN echo "Stalwart Mail Server is being set up..."

# Use ENTRYPOINT with CMD to allow for both the echo and the server start
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["echo 'Starting Stalwart Mail Server...' && exec /usr/local/bin/stalwart-mail"]
