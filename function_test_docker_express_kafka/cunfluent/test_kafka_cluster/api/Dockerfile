FROM node:16.15
ENV NODE_ENV=production

WORKDIR /app

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install --production

COPY . .

CMD [ "node", "healthy_brokers.js" ]

EXPOSE 8081
