FROM node:16.18.0-alpine3.16

RUN apk --no-cache update && apk --no-cache add sudo
RUN apk add --no-cache bash
RUN apk add --no-cache openjdk17-jdk

USER root
RUN npm install -g --acceptsuitecloudsdklicense @oracle/suitecloud-cli@

COPY . .

RUN npm ci && npm run build

ENTRYPOINT ["node", "dist/app.js"]

CMD ["-h"]