FROM stalwartlabs/mail-server:latest

# Expose necessary ports
EXPOSE 443 8080 25 587 465 143 993 4190 110 995

# Set the working directory
WORKDIR /opt/stalwart-mail

# Create a basic configuration file
RUN mkdir -p /opt/stalwart-mail/etc && \
    echo "[server]" > /opt/stalwart-mail/etc/config.toml && \
    echo "hostname = \"example.com\"" >> /opt/stalwart-mail/etc/config.toml && \
    echo "default_language = \"en\"" >> /opt/stalwart-mail/etc/config.toml && \
    echo "" >> /opt/stalwart-mail/etc/config.toml && \
    echo "[storage]" >> /opt/stalwart-mail/etc/config.toml && \
    echo "data = { type = \"sqlite\", path = \"/var/lib/stalwart-mail/data.db\" }" >> /opt/stalwart-mail/etc/config.toml && \
    echo "lookup = { type = \"sqlite\", path = \"/var/lib/stalwart-mail/lookup.db\" }" >> /opt/stalwart-mail/etc/config.toml && \
    echo "blob = { type = \"fs\", path = \"/var/lib/stalwart-mail/blob\" }" >> /opt/stalwart-mail/etc/config.toml && \
    echo "fts = { type = \"sqlite\", path = \"/var/lib/stalwart-mail/fts.db\" }" >> /opt/stalwart-mail/etc/config.toml && \
    echo "directory = { type = \"sqlite\", path = \"/var/lib/stalwart-mail/directory.db\" }" >> /opt/stalwart-mail/etc/config.toml

# Verify the configuration file
RUN cat /opt/stalwart-mail/etc/config.toml

# Add an echo command for logging
RUN echo "Stalwart Mail Server is being set up..."

# Use ENTRYPOINT with CMD to start the server correctly
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["echo 'Starting Stalwart Mail Server...' && \
      echo 'Configuration:' && \
      cat /opt/stalwart-mail/etc/config.toml && \
      echo 'Starting server...' && \
      stalwart-mail -c /opt/stalwart-mail/etc/config.toml"]
