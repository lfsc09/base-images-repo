FROM node:latest-alpine AS build
WORKDIR /app
COPY . /app
RUN npm install -g @angular/cli
RUN npm install --silent
RUN npm build

FROM nginx:alpine AS final
COPY --chown=nginx --from=build /app/build /var/www/html
EXPOSE 80
