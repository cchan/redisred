# syntax=docker/dockerfile:1

# Using node 16
FROM node:16-slim

#######################################################################

RUN mkdir /app
WORKDIR /app

# NPM will not install any package listed in "devDependencies" when NODE_ENV is set to "production",
# to install all modules: "npm install --production=false".
# Ref: https://docs.npmjs.com/cli/v9/commands/npm-install#description

ENV NODE_ENV production

COPY . .
COPY .env.prod .env

RUN npm install

LABEL fly_launch_runtime="nodejs"

# COPY --from=builder /root/.volta /root/.volta
# COPY --from=builder /app /app

# WORKDIR /app
# ENV NODE_ENV production
# ENV PATH /root/.volta/bin:$PATH

CMD [ "npm", "run", "start" ]
