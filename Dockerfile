FROM tomsquest/docker-radicale:latest

# Copy custom configuration files
COPY config /etc/radicale/config
COPY users /data/users

# Set proper permissions
RUN chmod 644 /etc/radicale/config /data/users

EXPOSE 3000

CMD ["sh", "-c", "envsubst < /etc/radicale/config > /tmp/config && /venv/bin/python -m radicale --config /tmp/config"]
