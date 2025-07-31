FROM tomsquest/docker-radicale:latest

# Copy configuration files
COPY config /etc/radicale/config
COPY users /etc/radicale/users

# Set proper permissions
RUN chmod 644 /etc/radicale/config /etc/radicale/users

# Create data directory
RUN mkdir -p /var/lib/radicale/collections

# Expose port
EXPOSE 5232

# Start Radicale
CMD ["python", "-m", "radicale"] 