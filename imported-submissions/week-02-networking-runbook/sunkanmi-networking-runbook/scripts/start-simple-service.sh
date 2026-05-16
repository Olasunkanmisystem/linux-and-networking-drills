#!/usr/bin/env bash
set -euo pipefail

read -rp "Enter your assigned port (8000-8020): " PORT

case "${PORT}" in
  800[0-9]|801[0-9]|8020)
    ;;
  *)
    echo "Invalid port. Choose a port from 8000 to 8020."
    exit 1
    ;;
esac

RESPONSE="HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nConnection: close\r\n\r\nWeek 2 simple service is running on port ${PORT}\r\n"

echo "Ready to serve one request on port ${PORT}."
echo "After one request, the script will stop. Run it again when you want another test."

printf '%b' "${RESPONSE}" | nc -l "${PORT}"
