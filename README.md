# docker-hub-hook-catcher
Sinatra app for fetching data about updates of docker hub repo

## Docker compose

```bash
docker-compose up -d
```

## How to update

```bash
git pull --prune
docker-compose up -d --no-deps --build app
```
