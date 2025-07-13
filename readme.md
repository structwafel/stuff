# Stuff, my config





# Extra stuff

## Docker Socket + systemd networkd

Always only enable `docker.socket` and not `docker.service`.
But keep in mind to modify `systemd-networkd-wait-online.service`

(otherwise you wait 2 minutes for starting docker)

https://unix.stackexchange.com/questions/381448/systemd-networkd-wait-online-failures

```zsh
sudo systemctl edit systemd-networkd-wait-online.service
# or
sudo SYSTEMD_EDITOR=micro systemctl edit systemd-networkd-wait-online.service

[Service]
ExecStart=
ExecStart=/usr/lib/systemd/systemd-networkd-wait-online --any
```