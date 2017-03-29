FROM node
EXPOSE 3000

RUN apt-get update && \
    apt-get -y install jq && \
    apt-get clean

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN curl -L  https://github.com/watson-developer-cloud/conversation-simple/archive/master.tar.gz --output /tmp/master.tar.gz && \
    tar -xzvf /tmp/master.tar.gz -C /usr/src/app --strip-components 1

RUN npm install --production && npm cache clean

CMD [ "bash", "-c ", "CONVERSATION_PASSWORD=$(jq -n 'env.BINDING|fromjson.password') && CONVERSATION_USERNAME=$(jq -n 'env.BINDING|fromjson.username') && npm start"]
