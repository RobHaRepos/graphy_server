# Use a lightweight and more secure base image
FROM node:18.20.8-alpine3.21

# Install only required dependencies (if needed)
RUN apk update && apk upgrade

# Copy app files
COPY graphserver.js .
COPY package.json .
COPY UScities.json .

# Install Node dependencies
RUN npm install --omit=dev

# Expose and run app
EXPOSE 4000
CMD ["node", "graphserver.js"]
