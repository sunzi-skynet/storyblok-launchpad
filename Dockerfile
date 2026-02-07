# syntax = docker/dockerfile:1
FROM node:22 as base

ARG PORT=3000
# @wtf: When building your app, any runtime dependencies are copied to .output/server/node_modules using https://github.com/vercel/nft. So you should never need to install dependencies in production; you just copy the .output directory (or use a deployment step listed on https://nitro.unjs.io/deploy).
# ENV NODE_ENV=production

WORKDIR /src

# Build
FROM base as build

COPY --link package.json package-lock.json ./
RUN npm install

COPY --link . .

RUN npm run build

# Run
FROM base

ENV NODE_ENV=production
ENV PORT=$PORT

COPY --from=build /src/.output /src/.output

CMD [ "node", ".output/server/index.mjs" ]
