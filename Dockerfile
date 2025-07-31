FROM tomsquest/docker-radicale:latest

# Copy custom configuration files
COPY config /etc/radicale/config
COPY users /data/users

# Set proper permissions
RUN chmod 644 /etc/radicale/config /data/users

# Expose port
EXPOSE 5232

# Start Radicale using the virtual environment Python
CMD ["/venv/bin/python", "-m", "radicale"] 