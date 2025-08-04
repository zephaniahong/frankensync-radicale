FROM tomsquest/docker-radicale:latest

# Install envsubst if not already there (should be in Alpine)
RUN apk add --no-cache gettext

COPY config.template /etc/radicale/config.template
COPY users /data/users

RUN chmod 644 /etc/radicale/config.template /data/users

CMD ["sh", "-c", "envsubst < /etc/radicale/config.template > /etc/radicale/config && /venv/bin/python -m radicale --config /etc/radicale/config"]
