# 1: Start off from nginx - alpine version image:
FROM nginx:alpine

# Step 2: Add the directory `/usr/bin` to PATH:
ENV PATH /usr/bin:$PATH

# Step 3: Specify the default PORT:
ENV PORT 80

# Step 4: Specify the default value for FORCE_SSL:
ENV FORCE_SSL false

# Step 5: Copy the `start-web` script:
COPY bin/start-web.sh /usr/bin/start-web

# Step 6: Copy the nginx configuration template:
COPY config/nginx.conf /etc/nginx/example.conf

# Step 7: Copy the app index.html page:
COPY index.html /usr/share/nginx/html/index.html

# Step 8: Set `start-web` as the default command:
CMD [ "start-web" ]
