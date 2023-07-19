FROM node:12-slim

WORKDIR /starter
ENV NODE_ENV development

COPY package.json /starter/package.json

Run apt-get update
Run apt install python3

RUN npm install pm2 -g
RUN npm install --production

COPY .env.example /starter/.env.example
COPY . /starter

CMD ["pm2-runtime","app.js"]

EXPOSE 8080
