# Troubleshooting Runbook – Local and Public Service Validation

## 1. Identify Assigned Port

### Command Used
```bash
ss -lntp | grep 8018
How it was identified

The assigned port was confirmed from the system setup and validated using ss to check active listeners.

Result Meaning

A Python process was listening on 0.0.0.0:8018.

Conclusion

Port 8018 is correctly assigned and actively bound to a running service.

2. Start the Local Service
Command Used
python3 -m http.server 8018
Purpose

To start a lightweight HTTP server on the assigned port for local validation.

Outcome

The service began listening on port 8018 and accepted incoming requests.

3. Prove Healthy State
Commands Used
ss -lntp | grep 8018
curl -I http://localhost:8018
curl http://localhost:8018 | head
What was observed
Port 8018 was in LISTEN state
HTTP response returned 200 OK
HTML directory listing was served
Conclusion

The service is healthy because:

It is running
It accepts connections
It returns valid HTTP responses
4. Wrong-Port Failure
Command Used
curl -I http://localhost:8999
What was observed

Connection failed because no service was listening on port 8999.

Interpretation

This confirms a wrong-port scenario, where requests are sent to an unused port.

Conclusion

Failure is due to incorrect port selection, not service failure.

5. Service Not Running Failure
Command Used (after stopping service)
curl -I http://localhost:8018
What was observed

Connection refused / no response.

Interpretation

The service process was no longer running.

Conclusion

This confirms a service-down scenario, where the application is not active.

6. Public Endpoint Scenarios
Commands Used
curl -I https://example.com
curl -I http://neverssl.com
curl -I https://httpbin.org/redirect/1
curl -I https://does-not-exist.invalid
Observations
HTTPS site returned 200 OK
HTTP site returned 200 OK without encryption
Redirect returned 302 FOUND
Invalid domain returned DNS resolution error
Conclusions
HTTPS success = secure and healthy endpoint
HTTP success = functional but unencrypted endpoint
302 = redirect behaviour
DNS error = name resolution failure

7. Final Conclusions

From all tests:

A listening port confirms service availability
HTTP 200 confirms working application response
Wrong port causes connection failure unrelated to service health
Service not running causes connection refusal
Public endpoints demonstrate differences in DNS, HTTP, and TLS behaviour

Each conclusion is supported by observable command output in the evidence files.
