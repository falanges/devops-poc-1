ARG NODE_ENV=18-alpine
FROM node:${NODE_ENV} AS base

FROM base AS builder

RUN apk add --no-cache libc6-compat
RUN apk update
WORKDIR /app
RUN yarn global add turbo
COPY . .
RUN turbo prune --scope=docs --docker

FROM base AS installer
RUN apk add --no-cache libc6-compat
RUN apk update
WORKDIR /app

COPY .gitignore .gitignore
COPY --from=builder /app/out/json/ .
COPY --from=builder /app/out/yarn.lock ./yarn.lock
RUN yarn install

COPY --from=builder /app/out/full/ .
COPY turbo.json turbo.json

# ARG TURBO_TEAM
# ENV TURBO_TEAM=$TURBO_TEAM

# ARG TURBO_TOKEN
# ENV TURBO_TOKEN=$TURBO_TOKEN

RUN yarn turbo run build --filter=docs...

FROM base AS runner
WORKDIR /app

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs
USER nextjs

ARG DOCS_PORT
ENV DOCS_PORT=3001
ENV NODE_ENV=production

COPY --from=installer /app/apps/docs/next.config.js .
COPY --from=installer /app/apps/docs/package.json .

COPY --from=installer --chown=nextjs:nodejs /app/apps/docs/.next/standalone ./
COPY --from=installer --chown=nextjs:nodejs /app/apps/docs/.next/static ./apps/docs/.next/static
COPY --from=installer --chown=nextjs:nodejs /app/apps/docs/public ./apps/docs/public

EXPOSE $DOCS_PORT

CMD next start --port $DOCS_PORT