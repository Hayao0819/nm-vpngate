##  VPN Gate for Network Manager
A script that makes it easy to connect Network Manager to a VPN Gate

## Feature
- Everything is written in shell scripts.
- Use the CSV API of VPN Gate
- Cache the server list
- Specializes in NetworkManager
- All actual configuration of the system is done via nmcli
- Supports server list by GUI
- Server filtering using regular expressions in config files
- Automatically connects to a server that matches the specified conditions
- Automatically remove settings that failed to connect
- Automatically connects with Systemd Unit

## Support VPN method
- OpenVPN (Install `networkmanager-openvpn`)
- L2TP (Install `networkmanager-strongswan` `networkmanager-l2tp`)

## Dependency
This script is developed on Arch Linux and test on Arch Linux and Ubuntu.

- networkmanager (nmcli)
- networkmanager-openvpn
- networkmanager-strongswan
- networkmanager-l2tp
- bash (Tested version is 5.1.8)
- curl
- GNU getopt
- zenity (for GUI server list)


## Use for trial
Clone the git repository and run `nm-vpngate`

```bash
git clone https://github.com/Hayao0819/nm-vpngate.git
bash nm-vpngate/nm-vpngate
```

## Install
By installing it, you can use global configuration files, Systemd Unit, etc.

### Arch Linux

```bash
yay -S nm-vpngate-git
```

### Other Linux

```
git clone https://github.com/Hayao0819/nm-vpngate.git
cd nm-vpngate/
sudo make install
```

### Usage
See `nm-vpngate -h` for normal command usage.

If you want to use systemd service to connect VPN Gate automatically, run it to enable service.

```bash
sudo systemctl enable nm-vpngate
```


## Related directories and files
These are the directories used by nm-vpngate

- (DIR) ~/.nm-vpngate/  
  Script saves openvpn config to the directory

- (DIR) /tmp/nm-vpngate.${UID}
  Script saves temporary data.

- (FILE) /tmp/nm-vpngate.${UID}/servers
  Script saves the cache to the file

- (FILE) /tmp/nm-vpngate.${UID}/connected
  Script saves the name of the last VPN you connected to
  
- (FILE) /etc/nm-vpngate.conf ~/.nm-vpngate.conf ~/.config/nm-vpngate.conf  
  Script loads config from them

