FROM node
EXPOSE 3000

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN curl -L  https://github.com/watson-developer-cloud/conversation-simple/archive/master.tar.gz --output /tmp/master.tar.gz && \
    tar -xzvf /tmp/master.tar.gz -C /usr/src/app --strip-components 1

RUN npm install --production && npm cache clean

CMD [ "npm", "start"]
