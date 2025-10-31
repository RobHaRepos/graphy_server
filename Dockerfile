FROM node:hydrogen-buster

# Update Debian packages (including git)
RUN apt-get update && \
    apt-get install -y --only-upgrade git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy your app files
COPY graphserver.js .
COPY package.json .
COPY UScities.json .

# Install Node dependencies
RUN npm install

# Expose and run app
EXPOSE 4000
CMD ["node", "graphserver.js"]
