FROM node:12-slim

WORKDIR /starter
ENV NODE_ENV development

COPY package.json /starter/package.json

Run add-apt-repository main
Run add-apt-repository universe
Run add-apt-repository restricted
Run add-apt-repository multiverse
Run apt install python3

RUN npm install pm2 -g
RUN npm install --production

COPY .env.example /starter/.env.example
COPY . /starter

CMD ["pm2-runtime","app.js"]

EXPOSE 8080
