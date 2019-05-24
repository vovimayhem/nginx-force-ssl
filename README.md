# Nginx conditional HTTPS redirection

An online version is available at:
- http://ancient-taiga-32245.herokuapp.com (Should redirect to HTTPS)
- https://ancient-taiga-32245.herokuapp.com (Should not redirect :))

## Run locally

1: Start the server:

```bash
docker-compose run --service-ports web
```

2: Make a request with cURL:

```bash
curl --verbose http://localhost
```

You should see the contents of the "index.html" file.

3: Stop the server by pressing `CTRL+C` on the terminal.

4: Configure the `FORCE_SSL` variable, setting it to true:

```bash
echo "FORCE_SSL=true" > .env
```

5: Repeat the request:

```bash
curl --verbose http://localhost
```

Notice how this time your'e being redirected to the HTTPS version.

6: Repeat the request, simulating the request being proxied by a load balancer:

```bash
curl -H 'X-Forwarded-Proto: https' --verbose http://localhost
```

You should see the contents of the "index.html" file again.
