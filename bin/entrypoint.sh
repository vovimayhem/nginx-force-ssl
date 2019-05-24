#! /bin/sh

# This is the production entrypoint.
# The main role for this script is to set the nginx listening port on the nginx
# configuration before actually launching nginx.
set -e

# 1: Define the functions that configure nginx and the runtime config for the
# app:

# Interpolates environment variables into a Nginx configuration template to be
# used by Nginx, including the port Nginx will listen to.
#
# Being able to specify the port to listen is required by Heroku to route
# requests from their routing mesh:
# See https://github.com/docker-library/docs/tree/master/nginx#using-environment-variables-in-nginx-configuration
apply_env_to_nginx_conf() {
  echo -n "Updating nginx config from current environment variables..."
  # Separate with ':' the variables that we want to interpolate... or else
  # envsubst won't work!
  vars_to_interpolate='$PORT:$FORCE_SSL';

  envsubst $vars_to_interpolate < /etc/nginx/example.conf > /tmp/nginx.conf;
  echo " Done!"
}

# 2: If the command was 'start', or none was given, start nginx:
if [ -z "$1" ] || [ "$1" == 'start' ]
then
  # 2.1: Generate the nginx configuration valid for this instance:
  apply_env_to_nginx_conf

  # 2.2: Replace the given command with the nginx command:
  set -- nginx -c /tmp/nginx.conf -g 'daemon off;'
fi

if [ "$1" == 'nginx' ]; then echo "Starting the app's Nginx instance..."; fi;

# 3: Execute the given or default command:
exec "$@"
