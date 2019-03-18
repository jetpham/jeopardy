FROM node:8

WORKDIR /usr/src/app

COPY . .
RUN chown -R node:node /usr/src/app

RUN npm install -g bower
RUN npm install && bower install --allow-root


EXPOSE 3000
CMD ["node", "app.js"]