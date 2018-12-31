FROM node:alpine
ENV GOOGLE_HOME_KODI_CONFIG="/config/kodi-hosts.config.js"
ENV NODE_ENV=production
ENV PORT=8099

VOLUME /config
WORKDIR /home/node/app

COPY package*.json ./
RUN apk add --no-cache --virtual .gyp python make g++ \
COPY . .

EXPOSE 8099
USER node
CMD ["node", "server.js"]
