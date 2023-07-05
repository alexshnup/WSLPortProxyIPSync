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

- Open a PowerShell terminal as an administrator. Right-click on the PowerShell icon and choose "Run as administrator" from the context menu.

- Navigate to the directory where you cloned or downloaded the repository.

- Run the following command to execute the script with administrative privileges:

```
Set-ExecutionPolicy Bypass -Scope Process -Force
.\WSLPortProxyIPSync.ps1
```

- WSLPortProxyIPSync will automatically detect the IP address of the WSL environment and update the port forwarding rules using the "netsh interface portproxy" command in Windows accordingly.

Note: Running the script with administrative privileges is required to modify the port forwarding configuration using the "netsh" command.

## Contributing

Contributions are welcome! If you have any suggestions, bug reports, or feature requests, please open an issue or submit a pull request. Make sure to provide detailed information about your contribution.

## License

This project is licensed under the MIT License.
