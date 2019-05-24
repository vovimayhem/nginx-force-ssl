# 1: Start off from nginx - alpine version image:
FROM nginx:alpine

ENV PORT 80
ENV FORCE_SSL false

COPY bin/entrypoint.sh /bin/
COPY config/nginx.conf /etc/nginx/example.conf
COPY index.html /usr/share/nginx/html/index.html

ENTRYPOINT [ "/bin/entrypoint.sh" ]
CMD [ "start" ]
