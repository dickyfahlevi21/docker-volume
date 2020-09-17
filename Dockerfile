FROM node:latest

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package.json .

# If you are building your code for production
# RUN npm ci --only=production
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

EXPOSE 3000
RUN echo "success"

CMD [ "node", "app.js" ]
