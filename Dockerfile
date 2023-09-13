FROM node:10-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
RUN mkdir -p /home/node/app/views/

WORKDIR /home/node/app

COPY package*.json ./

USER node

RUN npm install

COPY --chown=node:node . .

COPY nodejs_app/views/* /home/node/app/views/

EXPOSE 8080

CMD [ "node", "app.js" ]
