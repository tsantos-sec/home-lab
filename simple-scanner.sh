#!/bin/bash
# A simple script to check if a host is up and scan common ports

echo "Enter the IP address to scan:"
read ip

echo "Scanning $ip..."
ping -c 1 $ip > /dev/null

if [ $status -eq 0 ]; then
    echo "Host is UP"
    echo "Checking common ports (22, 80, 443)..."
    for port in 22 80 443; do
        timeout 1 bash -c "echo >/dev/tcp/$ip/$port" 2>/dev/null && echo "Port $port is OPEN" || echo "Port $port is CLOSED"
    done
else
    echo "Host is DOWN"
fi
