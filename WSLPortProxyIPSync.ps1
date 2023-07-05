 # Retrieve the IP address from WSL
$wslCommand = "ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d{1,3}(\.\d{1,3}){3}'"
$newConnectAddress = Invoke-Expression "wsl --exec bash -c `"$wslCommand`""

# Display the retrieved IP address
$newConnectAddress

# Get the portproxy rules using netsh
$commandOutput = netsh interface portproxy show all
$lines = $commandOutput -split "`n" | Select-Object -Skip 2

# Initialize the array to store rules
$rules = @()

# Extract rules from the command output
foreach ($line in $lines) {
    $fields = $line -split "\s+"
    $listenAddress = $fields[0]
    $listenPort = $fields[1]
    $connectAddress = $fields[2]
    $connectPort = $fields[3]

    # Add rule to the array if ListenAddress is "0.0.0.0"
    if ($listenAddress -eq "0.0.0.0") {
        $rule = @{
            ListenAddress = $listenAddress
            ConnectAddress = $connectAddress
            ListenPort = $listenPort
            ConnectPort = $connectPort
        }

        $rules += $rule
    }
}

# Display the rules
$rules

# Execute portproxy command for each rule
foreach ($rule in $rules) {
    # Build the command string
    $command = "netsh interface portproxy add v4tov4 listenport=$($rule.ListenPort) listenaddress=$($rule.ListenAddress) connectport=$($rule.ConnectPort) connectaddress=$($newConnectAddress)"

    # Display the command
    $command

    # Execute the command
    Invoke-Expression $command
}
 
