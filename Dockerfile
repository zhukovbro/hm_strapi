FROM node:current-alpine3.19@sha256:5207b5fe5a54c78aa9542ce0b83a940301eb12d2477eee0dd1faeb74c7c96b34

RUN apk add --no-cache python3 make g++ sqlite

WORKDIR /app

COPY package*.json ./

RUN npm install && npm cache clean --force

COPY . .

RUN npm run build

# Установите переменные окружения для Strapi
ENV NODE_ENV=production
ENV HOST=0.0.0.0
ENV PORT=1337

# Откройте порт для Strapi
EXPOSE 1337


CMD ["npm", "start"]