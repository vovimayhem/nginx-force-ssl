# Step 1: Start off from nginx - alpine version image:
FROM nginx:alpine

# Step 2: Specify the default PORT:
ENV PORT 80

# Step 3: Specify the default value for FORCE_SSL:
ENV FORCE_SSL false

# Step 4: Copy the `start-web` script:
COPY bin/start-web.sh /usr/local/bin/start-web

# Step 5: Copy the nginx configuration template:
COPY config/nginx.conf /etc/nginx/example.conf

# Step 6: Copy the app index.html page:
COPY index.html /usr/share/nginx/html/index.html

# Step 7: Set `start-web` as the default command:
CMD [ "start-web" ]
