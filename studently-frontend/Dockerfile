FROM node:13.0.1

ARG UID
RUN adduser frontend --uid 1001 --disabled-password --gecos ""

RUN mkdir -p /usr/src/nuxt-app
WORKDIR /usr/src/nuxt-app

COPY package.json yarn.lock /usr/src/nuxt-app/
RUN npm install
RUN yarn

COPY . /usr/src/nuxt-app/

# build necessary, even if no static files are needed,
# since it builds the server as well
RUN npm run build

# start the app
CMD [ "npm", "start" ]

