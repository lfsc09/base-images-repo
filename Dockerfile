FROM node:current-alpine AS build
WORKDIR /app
COPY . /app
RUN npm install -g @angular/cli
RUN npm install --silent
RUN npm run build

FROM nginx:alpine AS final
ARG PROJECT_NAME
COPY --chown=nginx --from=build /app/dist/${PROJECT_NAME}/browser /usr/share/nginx/html
WORKDIR /etc/nginx/conf.d
RUN rm -rf default.conf && \
    touch default.conf && \
    printf "server {\n" >> default.conf && \
    printf "  listen 80;\n" >> default.conf && \
    printf "  listen [::]:80;\n" >> default.conf && \
    printf "  root /usr/share/nginx/html;\n" >> default.conf && \
    printf "  index index.html;\n" >> default.conf && \
    printf "  location / {\n" >> default.conf && \
    printf "    try_files \$uri\$args \$uri\$args /index.html;\n" >> default.conf && \
    printf "  }\n" >> default.conf && \
    printf "}" >> default.conf
    
EXPOSE 80
