# Dependency stage
FROM node:10 AS deps

COPY ./package.json /package.json

RUN npm i --production

# Final stage
FROM node:10-alpine

COPY --from=deps /node_modules /node_modules

COPY ./package.json /package.json
COPY ./index.js /index.js

CMD ["npm", "run", "start"]

EXPOSE 3000
