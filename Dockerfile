FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm i
COPY . .
RUN npm run build

# /app/build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html