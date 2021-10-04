##  VPN Gate for Network Manager
A script that makes it easy to connect Network Manager to a VPN Gate

## Support VPN method
- OpenVPN (Install `networkmanager-openvpn`)
- L2TP (Install `networkmanager-strongswan`)

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

