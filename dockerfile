FROM node:18.0.0

WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .

CMD ["node","app/app.js"]
EXPOSE 3005
