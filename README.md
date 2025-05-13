# 🐳 Dockerized Services Project

This repository contains a Docker-based infrastructure setup, including services like WordPress, MariaDB, Nginx, Redis, and more. It is designed to be run with `docker-compose`, with each service modularized under the `srcs/requirements` directory.

---

## 📁 Project Structure

```text
├── env_setup.sh              # Script to set up environment variables
├── Makefile                  # Automation for build and deployment
├── README.md                 # Project documentation
├── srcs                      # Docker-compose and service definitions
│   ├── docker-compose.yml    # Main docker-compose file
│   └── requirements
│       ├── bonus             # Additional/bonus services
│       │   ├── adminer
│       │   │   └── Dockerfile
│       │   ├── DNS
│       │   │   ├── beadam.42.fr.zone
│       │   │   ├── Dockerfile
│       │   │   ├── named.conf.local
│       │   │   └── named.conf.options
│       │   ├── ftp
│       │   │   ├── Dockerfile
│       │   │   └── vsftpd.conf
│       │   └── redis
│       │       └── Dockerfile
│       ├── mariadb
│       │   ├── Dockerfile
│       │   └── tools
│       │       └── config.sh
│       ├── nginx
│       │   ├── conf.d
│       │   │   └── nginx.conf
│       │   └── Dockerfile
│       └── wordpress
│           ├── Dockerfile
│           └── tools
│               ├── init.sh
│               └── script.sh
```

---

## 🚀 Getting Started


### It's as simple as: Build and run the containers
```bash
make
```
> `make up` runs the env_setup script to help you around the env variables.
> You can use `make down` to stop and remove containers, or `make clean` to remove all images/volumes.

---

## 🔧 Included Services

| Service     | Description                          |
|-------------|--------------------------------------|
| WordPress   | CMS powered by PHP and MariaDB       |
| MariaDB     | Relational database engine           |
| Nginx       | Web server and reverse proxy         |
| Redis (bonus)   | In-memory key-value store         |
| FTP (bonus)     | File Transfer Protocol server     |
| Adminer (bonus) | Lightweight DB management tool    |
| DNS (bonus)     | Custom DNS setup with BIND        |

---

## 📝 Notes

- All services are containerized and isolated using Docker.
- Bonus services are optional and can be included as needed.
- Docker and Docker Compose must be installed on your system.
- Designed for Unix-based systems (Linux/macOS).

---
