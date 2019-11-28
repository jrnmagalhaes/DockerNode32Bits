# Docker Node 32 bits

## Disclaimer
This project was born from the necessity of run a NodeJS service on a Ubuntu 14.04 32 bits machine. The NodeJS service should connect to a database running on the machine to execute some routines.

P.S.: The real NodeJS service is not here.

## Setup

1. Build the image:

```bash
docker build -t jrnmagalhaes/dockertest .
```

2. Create a temporary enviroment variable to store host's ip.

```bash
HOSTIP=`ip -4 addr show scope global dev docker0 | grep inet | awk '{print \$2}' | cut -d / -f 1`
```

3. Run the container

```bash
docker run --add-host=hostmachine:${HOSTIP} -p 3000:3000 -d jrnmagalhaes/dockertest
```
