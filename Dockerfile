FROM node:latest

# Create app directory
WORKDIR /usr/src/app

COPY package.json .

RUN npm install

# Bundle app source
COPY . ./

RUN echo "start"
ENV PORT=3000
ENV SECRET=Rahasia
ENV GMAIL_USERNAME=example@gmail.com
ENV GMAIL_PASSWORD=passwordnya123beneran
ENV DB_USERNAME=root
ENV DB_PASSWORD=password
ENV DB_HOST=172.18.0.2
ENV DB_NAME=database_development
RUN npx sequelize-cli db:migrate

COPY --chown=node:node . .

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x ./docker-entrypoint.sh

EXPOSE 3000
RUN echo "success"

CMD ["./docker-entrypoint.sh", "node", "app.js" ]
