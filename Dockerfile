FROM nginx:latest

COPY roles/webserver/files/index.html /usr/share/nginx/html/index.html

COPY roles/webserver/files/login.html /usr/share/nginx/html/login.html

COPY roles/webserver/files/password.txt /usr/share/nginx/html/password.txt

EXPOSE 80
    