FROM node:7.8.0

RUN mkdir /app

ADD index.js /app/index.js
ADD index.html /app/index.html
WORKDIR /app

RUN npm install connect serve-static

EXPOSE 80

CMD ["node", "index.js"]
