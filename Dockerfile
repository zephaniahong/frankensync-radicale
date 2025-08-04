FROM tomsquest/docker-radicale:latest

COPY config /config/config
COPY users /data/users

RUN chmod 644 /config/config /data/users

EXPOSE 5232