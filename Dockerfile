FROM tomsquest/docker-radicale:latest

COPY config /config/config
COPY users /data/users

RUN chmod 644 /etc/radicale/config /data/users

EXPOSE 5232