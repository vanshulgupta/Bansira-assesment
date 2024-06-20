FROM node:slim AS builder
WORKDIR /app
COPY node-hello/ ./
RUN npm install
COPY . .
CMD ["node", "index.js"]

FROM node:alpine
WORKDIR /app
COPY --from=builder /app /app
EXPOSE 3000
CMD ["node", "index.js"]
