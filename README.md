##  VPN Gate for Network Manager
A script that makes it easy to connect Network Manager to a VPN Gate

## Feature
- Use the CSV API of VPN Gate
- Cache the server list
- Specializes in NetworkManager
- All actual configuration of the system is done via nmcli
- Supports server list by GUI
- Server filtering using regular expressions in config files
- Automatically connects to a server that matches the specified conditions

## Support VPN method
- OpenVPN (Install `networkmanager-openvpn`)
- L2TP (Install `networkmanager-strongswan`)

## Dependency
This script is developed on Arch Linux and test on Arch Linux and Ubuntu.

- networkmanager (nmcli)
- networkmanager-openvpn
- networkmanager-strongswan
- bash (Tested version is 5.1.8)
- curl
- GNU getopt
- zenity (for GUI server list)


## Usage
Clone the git repository and run `nm-vpngate`

```bash
git clone https://github.com/Hayao0819/nm-vpngate.git
bash nm-vpngate/nm-vpngate
```

## Related directories and files
These are the directories used by nm-vpngate

- (DIR) ~/.nm-vpngate/  
  Script saves openvpn config to the directory
- (FILE) /tmp/${UID}-nm-vpngate  
  Script saves the cache to the file
- (FILE) /etc/nm-vpngate.conf ~/.nm-vpngate.conf ~/.config/nm-vpngate.conf  
  Script loads config from them

