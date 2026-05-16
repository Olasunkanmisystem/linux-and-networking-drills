# Service Recovery Log

## Failure 1 — Wrong Port (8999)
- No service listening on port 8999
- curl failed with connection refused
- Confirms incorrect port selection

## Failure 2 — Service Stopped
- HTTP request to 8018 failed after stopping service
- curl returned connection refused
- Confirms service was not running

## Recovery
- Restarted service using:
  python3 -m http.server 8018
- Verified:
  - port is listening
  - HTTP 200 OK returned
