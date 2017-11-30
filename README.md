# docker-hub-hook-catcher
Sinatra app for fetching data about updates of docker hub repo

# How to init
```
docker build -t docker-hub-hook-catcher .
docker run -d -p 8088:80 --name docker-hub-hook-catcher docker-hub-hook-catcher
```