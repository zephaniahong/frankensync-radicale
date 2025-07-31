FROM tomsquest/docker-radicale:latest

# Copy custom configuration files
COPY config /etc/radicale/config
COPY users /data/users

# Set proper permissions
RUN chmod 644 /etc/radicale/config /data/users

# Expose port
EXPOSE 5232

# Start Radicale
CMD ["python", "-m", "radicale"] 