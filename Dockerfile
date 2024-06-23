FROM node:18-alpine3.20@sha256:e37da457874383fa9217067867ec85fe8fe59f0bfa351ec9752a95438680056e

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