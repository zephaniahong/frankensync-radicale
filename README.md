# Radicale Docker for Railway

This is a custom Radicale setup using the `tomsquest/docker-radicale` Docker image, configured for deployment on Railway with IPv6 support.

## IPv6 Configuration

The setup is configured to support both IPv4 and IPv6:

- **Server binding**: `[::]:5232` (binds to all IPv6 and IPv4 addresses)
- **Docker network**: IPv6 enabled bridge network
- **Railway**: Automatically handles IPv6 routing

## Local Development

To run locally with Docker Compose:

```bash
# Create data directory
mkdir -p data

# Start the service
docker-compose up -d

# View logs
docker-compose logs -f

# Stop the service
docker-compose down
```

The service will be available at:
- IPv4: `http://localhost:5232`
- IPv6: `http://[::1]:5232` (if IPv6 is available on your system)

## Railway Deployment

### Prerequisites

1. Install Railway CLI: `npm install -g @railway/cli`
2. Login to Railway: `railway login`

### Deployment Steps

1. **Initialize Railway project** (if not already done):
   ```bash
   railway init
   ```

2. **Deploy to Railway**:
   ```bash
   railway up
   ```

3. **Set up environment variables** (if needed):
   ```bash
   railway variables set RADICALE_CONFIG=/etc/radicale/config
   ```

4. **Access your deployed service**:
   ```bash
   railway open
   ```

### Configuration

The deployment uses the following configuration:

- **Image**: `tomsquest/docker-radicale:latest`
- **Port**: 5232 (exposed automatically by Railway)
- **IPv6**: Enabled with dual-stack support
- **Config**: Mounted from `./config` to `/etc/radicale/config`
- **Users**: Mounted from `./users` to `/etc/radicale/users`
- **Data**: Mounted from `./data` to `/var/lib/radicale/collections`

### Default Credentials

- **Username**: `admin`
- **Password**: `admin`

⚠️ **Important**: Change these credentials before deploying to production!

### Health Check

The service includes a health check that verifies the CalDAV endpoint is accessible at `/.well-known/caldav`.

### Customization

To customize the configuration:

1. Edit the `config` file to modify Radicale settings
2. Edit the `users` file to add/modify user accounts
3. The `data` directory will store all calendar and contact collections

### Security Notes

- The default configuration uses bcrypt encryption for passwords
- Only owner access is allowed (users can only access their own data)
- Consider adding SSL/TLS termination at the Railway level
- Change default credentials before production use
- IPv6 support provides additional connectivity options 