FROM tomsquest/docker-radicale:latest

# Copy custom configuration files
COPY config /etc/radicale/config
COPY users /data/users

# Set proper permissions
RUN chmod 644 /etc/radicale/config /data/users

EXPOSE 3000

CMD ["/venv/bin/python", "-m", "radicale", "--server-hosts", "0.0.0.0:${PORT}"]