FROM node:hydrogen-bookworm

# Upgrade system packages (git, imagemagick, etc.)
RUN apt-get update && \
    apt-get install -y --only-upgrade git imagemagick && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy your app files
COPY graphserver.js .
COPY package.json .
COPY UScities.json .

# Install Node dependencies
RUN npm install

EXPOSE 4000
CMD ["node", "graphserver.js"]
