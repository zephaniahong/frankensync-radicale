FROM tomsquest/docker-radicale:latest

# Install gettext to provide envsubst
RUN apk add --no-cache gettext

# Copy custom configuration files
COPY config /etc/radicale/config
COPY users /data/users

# Set proper permissions
RUN chmod 644 /etc/radicale/config /data/users

EXPOSE 3000

CMD ["sh", "-c", "/venv/bin/python -m radicale --config /etc/radicale/config --host 0.0.0.0 --port ${PORT:-3000}"]