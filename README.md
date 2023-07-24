# Project Overview
This script addresses a problem faced when running applications within the Windows Subsystem for Linux (WSL) environment and making them available over the network from other machines.

Typically, port forwarding is facilitated through the "netsh interface portproxy" command. However, an inherent issue arises because the WSL IP address changes after every system restart. Consequently, the existing port forwarding rules become invalid, rendering the services running inside the WSL inaccessible over the network. These rules are still tied to the previous WSL IP address, not the new one, necessitating a manual update of the address in each port forwarding rule.

The purpose of this script is to automate this process. It automatically updates the target IP address in all existing port forwarding rules to match the current IP address of the WSL. This ensures that, irrespective of any changes in the WSL's IP address, the services running inside the WSL remain consistently available over the network. It effectively eliminates the need for manual intervention each time the system is restarted, enhancing usability and efficiency.

You just need to add a script to the scheduler so that it starts automatically at startup

# WSLPortProxyIPSync

WSLPortProxyIPSync is a PowerShell script that helps synchronize the IP address of a Windows Subsystem for Linux (WSL) environment with the port forwarding configuration using the "netsh interface portproxy" command in Windows. It automates the process of updating the IP address in the port forwarding rules, ensuring that the forwarded ports always point to the correct WSL IP address even after system reboots.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Features

- Automatically synchronizes the IP address of the WSL environment with port forwarding configuration using "netsh interface portproxy" command in Windows.
- Eliminates the need to manually update port forwarding rules after system reboots.
- Supports dynamic management of port forwarding rules for multiple ports.

## Installation

1. Clone or download the repository:

```powershell
git clone https://github.com/alexshnup/WSLPortProxyIPSync.git
cd wsl-port-proxy-ipsync
```

Ensure that you have PowerShell installed on your Windows system.

## Usage

- Add all needed portproxy rules with any target IP (for example 1.2.3.4)
  ```
   netsh interface portproxy add v4tov4 listenport=80 listenaddress=0.0.0.0 connectport=80 connectaddress=1.2.3.4
   netsh interface portproxy add v4tov4 listenport=443 listenaddress=0.0.0.0 connectport=443 connectaddress=1.2.3.4
  ```

- Check added rules:
  ```
    PS C:\Windows\system32> netsh interface portproxy show all
    Listen on ipv4:             Connect to ipv4:
    
    Address         Port        Address         Port
    --------------- ----------  --------------- ----------
    0.0.0.0         80          1.2.3.4         80
    0.0.0.0         443         1.2.3.4         443
  ```


- Open a PowerShell terminal as an administrator. Right-click on the PowerShell icon and choose "Run as administrator" from the context menu.

- Navigate to the directory where you cloned or downloaded the repository.

- Run the following command to execute the script with administrative privileges:

```
Set-ExecutionPolicy Bypass -Scope Process -Force
.\WSLPortProxyIPSync.ps1
```

- WSLPortProxyIPSync will automatically detect the IP address of the WSL environment and update the port forwarding rules using the "netsh interface portproxy" command in Windows accordingly.

- Check added rules again:
  ```
    PS C:\Windows\system32> netsh interface portproxy show all
    Listen on ipv4:             Connect to ipv4:
    
    Address         Port        Address         Port
    --------------- ----------  --------------- ----------
    0.0.0.0         80          172.27.224.80   80
    0.0.0.0         443         172.27.224.80   443
  ```

Note: Running the script with administrative privileges is required to modify the port forwarding configuration using the "netsh" command.

## Contributing

Contributions are welcome! If you have any suggestions, bug reports, or feature requests, please open an issue or submit a pull request. Make sure to provide detailed information about your contribution.

## License

This project is licensed under the MIT License.
