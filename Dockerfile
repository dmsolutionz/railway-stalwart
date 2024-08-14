FROM stalwartlabs/mail-server:latest

EXPOSE 443 8080 25 587 465 143 993 4190 110 995

# Add an echo command
RUN echo "Stalwart Mail Server is being set up..."

# Use ENTRYPOINT with CMD to allow for both the echo and the server start
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["echo 'Starting Stalwart Mail Server...' && stalwart-mail"]
