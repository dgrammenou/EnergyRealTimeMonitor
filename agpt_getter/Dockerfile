FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install -y kafkacat

ENV NODE_VERSION=16.13.0
RUN apt-get install -y curl
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version

#ENTRYPOINT ["kafkacat"]

RUN mkdir /app
WORKDIR /app

COPY . .
RUN chmod +x health_check.sh


CMD ["node", "startup_new.js"]
EXPOSE 8081
#POSTGRE PORT
EXPOSE 5432 
