FROM nginx:latest

COPY roles/webserver/files/ /usr/share/nginx/html/

EXPOSE 80