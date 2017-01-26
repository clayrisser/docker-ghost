FROM ghost:latest

EXPOSE 2368

ENV MYSQL_HOST=mysql
ENV MYSQL_DATABASE=ghost
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=hellodocker
ENV GHOST_URL=http://ghost.example.com

WORKDIR /usr/src/ghost/

COPY ./config.js /usr/src/ghost/config.js

ENTRYPOINT npm start --production
