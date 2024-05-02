#!/bin/bash

RPC_URL=""

OUTPUT_DIR="logs"

# Proxy configuration
PROXY_HOST=""
PROXY_PORT=""
PROXY_USER=""
PROXY_PASS=""

eth_data=$(curl -s -x "socks5://$PROXY_HOST:$PROXY_PORT" -U "$PROXY_USER:$PROXY_PASS" -H "Content-type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"eth_gasPrice","id":1}' "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    
    echo "$eth_data" >> "$OUTPUT_DIR/ethereum.txt"
    
    echo "Ethereum data fetched and saved to $OUTPUT_DIR/ethereum.txt."
else
    echo "Failed to fetch Ethereum data."
fi
