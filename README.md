# linuxctl

This repository began as a repeatable way to setup a
[raspberry pi 5](https://www.raspberrypi.com/products/raspberry-pi-5/)
running
[Ubuntu 24.04.03 LTS](https://ubuntu.com/download/raspberry-pi)
for use as a local development environment.

`linuxctl` bootstraps a shell environment for use as a local development
environment.

## Install

Clone the repository to the workstation:

```bash
export LINUXCTL_INSTALL_DIR="${HOME}/code/github.com/mcgarebear"

mkdir --parents "${LINUXCTL_INSTALL_DIR}"
git clone git@github.com/mcgarebear/linuxctl.git "${LINUXCTL_INSTALL_DIR}/linuxctl"

export PATH="${LINUXCTL_INSTALL_DIR}/linuxctl:${PATH}"
export PATH="${LINUXCTL_INSTALL_DIR}/linuxctl/bin:${PATH}"
```

Begin shell, update installed packages:

```bash
linuxctl init
linuxctl update
```

Install optional packages:

```bash
linuxctl install --all
```
