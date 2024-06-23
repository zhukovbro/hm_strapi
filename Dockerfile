FROM node:current-alpine3.19@sha256:5207b5fe5a54c78aa9542ce0b83a940301eb12d2477eee0dd1faeb74c7c96b34

WORKDIR /app

COPY package*.json ./

RUN npm install && npm cache clean --force

COPY . .

RUN npm run build && \
    npm uninstall npm && \
    rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

EXPOSE 4000

CMD ["npm", "run start"]