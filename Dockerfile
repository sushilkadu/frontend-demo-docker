FROM node:alpine as builder
WORKDIR /usr/frontend-demo
COPY package*.json ./
RUN npm install
COPY ./ ./
RUN ["yarn", "build"]


FROM nginx
EXPOSE 80
COPY --from=builder /usr/frontend-demo/build /usr/share/nginx/html