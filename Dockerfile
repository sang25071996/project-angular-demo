#stage1
FROM node:10.21.0-alpine3.10 as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod
#stage2
FROM  nginx:1.18.0-alpine as prod-stage
COPY --from=node /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]