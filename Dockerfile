FROM nginxinc/nginx-unprivileged:1.27-alpine

COPY --chown=nginx:nginx index.html impressum.html datenschutz.html styles.css script.js favicon.svg /usr/share/nginx/html/
COPY --chown=nginx:nginx nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080
