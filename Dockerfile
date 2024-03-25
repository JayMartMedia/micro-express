FROM node:18-alpine
WORKDIR /app
COPY package.json package.json
COPY package-lock.json package-lock.json
RUN npm ci
COPY ./src ./src
ENTRYPOINT ["npm", "start"]
