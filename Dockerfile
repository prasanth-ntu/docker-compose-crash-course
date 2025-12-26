# Build our custom JS application as a container and run it as part of docker compose along with mongodb and mongo-express.

FROM node:20-alpine

RUN mkdir -p /home/app

COPY ./app /home/app

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

# This will run 'npm install' in /home/app (due to the WORKDIR above) to install all dependencies listed in package.json inside the image.
RUN npm install

# no need for /home/app/server.js because of WORKDIR
CMD ["node", "server.js"]
