FROM stalwartlabs/mail-server:latest

EXPOSE 443 8080 25 587 465 143 993 4190 110 995

VOLUME /opt/stalwart-mail

CMD ["stalwart-mail"]
