FROM node:hydrogen-bullseye

RUN apt-get update && \
    apt-get install --only-upgrade -y imagemagick && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY graphserver.js .
COPY package.json .
COPY UScities.json .

RUN npm install
EXPOSE 4000
CMD ["node", "graphserver.js"]
