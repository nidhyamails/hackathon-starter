FROM node:12-slim

WORKDIR /starter
ENV NODE_ENV development

COPY package.json /starter/package.json

Run docker stop $(sudo docker ps -aq)
Run docker container prune
Run docker image prune
RUN apt-get update && apt-get install -y python-software-properties

RUN npm install pm2 -g
RUN npm install --production

COPY .env.example /starter/.env.example
COPY . /starter

CMD ["pm2-runtime","app.js"]

EXPOSE 8080
