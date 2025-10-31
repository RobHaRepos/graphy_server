FROM node:hydrogen-bullseye

# Update packages (git will already be patched)
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY graphserver.js .
COPY package.json .
COPY UScities.json .

RUN npm install
EXPOSE 4000
CMD ["node", "graphserver.js"]
