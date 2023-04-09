$connectedWifi=(get-netconnectionProfile).Name
sudo netsh wlan set profileparameter name="$connectedWifi" cost=Fixed
