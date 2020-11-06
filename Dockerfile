FROM klakegg/hugo:0.78.0 AS hugo
COPY . /app
WORKDIR /app
RUN hugo

FROM nginx:1.19-alpine AS nginx
COPY --from=hugo /app/public /usr/share/nginx/html
