FROM node:12-slim

WORKDIR /starter
ENV NODE_ENV development

COPY package.json /starter/package.json

RUN apt-get -y update
RUN apt-get install -y nodejs
RUN apt-get install -y composer
RUN apt-get install -y nginx
RUN apt-get install -y software-properties-common
RUN apt-get install -y python-software-properties

RUN npm install pm2 -g
RUN npm install --production

COPY .env.example /starter/.env.example
COPY . /starter

CMD ["pm2-runtime","app.js"]

EXPOSE 8080
