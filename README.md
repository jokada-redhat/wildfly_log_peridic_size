# wildfly_log_peridic_size

## build

```
docker-compose build
```

## run

```
docker-compose up -d
```

## request

```
ab -n 100 -c 10 http://127.0.0.1:38080/hello/index.jsp
```

## check

```
ls -l log/
```
