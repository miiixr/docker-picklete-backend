docker-picklete-backend
========================

Example usage: 

```
FROM miiixr/docker-picklete-backend
COPY ./ /picklete
WORKDIR /picklete

RUN /bin/bash -l -c 'npm i'
RUN /bin/bash -l -c 'node_modules/.bin/grunt prod'

ENV PORT "1337"
ENV NODE_ENV "production"
ENV DOMAIN_HOST "localhost:1337"
ENV MYSQL_ROOT_PASSWORD "pass@word01"

EXPOSE 3306
EXPOSE 1337
CMD /bin/bash -l -c 'npm start'
```

Environment variables
---------------------

 - `MYSQL_ROOT_PASSWORD`: The password for the root user. Defaults to a blank password
 - `MYSQL_DATABASE`: A database to automatically create. If not provided, does not create a database.
 - `MYSQL_USER`: A user to create that has access to the database specified by `MYSQL_DATABASE`.
 - `MYSQL_PASSWORD`: The password for `MYSQL_USER`. Defaults to a blank password.
