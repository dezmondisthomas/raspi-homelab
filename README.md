# Raspberry Pi Homelab Setup

This repository provides modular Docker Compose setups for building a personal home server on a Raspberry Pi 5.  
You can choose which phase you want to deploy and expand your homelab step-by-step.



## Structure

- `phase1-core/` - Core network services (Pi-hole adblocker + Tailscale exit node setup)
- `phase2-privatecloud/` - Nextcloud personal cloud with MariaDB and Redis
- `phase3-devmedia/` - Developer and media stack (code-server, Stremio media server)
- `shared/` - Environment variable templates



## Usage

1. Clone the repo:

```bash
git clone https://github.com/yourusername/raspi-homelab.git
cd raspi-homelab
```

2. Copy `.env.example` to `.env` and fill secrets:

```bash
cp shared/.env.example .env
nano .env
```

3. Choose a phase folder and start the stack:

```bash
cd phase1-core
docker compose up -d
```

4. Repeat for other phases as you expand your setup.



## Notes

- **Tailscale** must be installed on the host OS directly (outside Docker) for networking mesh.
- Always keep your `.env` file private and never commit it to public repos.
- Pi-hole runs in host network mode to listen on ports 53 and 80.
- Nextcloud is mapped to port 8080; adjust as needed.



## Future Plans

- Add monitoring and alerting stack (Prometheus, Grafana)
- Automate backups
- Extend to more media servers like Jellyfin, Plex
- Secure with HTTPS & reverse proxy (e.g., Nginx Proxy Manager)



Feel free to contribute or open issues!



*Built by Thomas.*
