FROM node:12-slim

WORKDIR /starter
ENV NODE_ENV development

COPY package.json /starter/package.json

RUN apk-get add --update python3 make g++ && rm -rf /var/cache/apk/*

RUN npm install pm2 -g
RUN npm install --production

COPY .env.example /starter/.env.example
COPY . /starter

CMD ["pm2-runtime","app.js"]

EXPOSE 8080
