#for 32 bits
FROM i386/node:10-alpine

# Create app directory
WORKDIR /usr/src/app

# Install knex dependencie
RUN npm install -g knex

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 3000
CMD [ "node", "index.js" ]