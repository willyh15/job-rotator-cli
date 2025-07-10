#!/bin/bash
# Launch job rotator every hour using `watch`

echo "[*] Watching job_rotator.sh every 60 minutes..."
watch -n 3600 ./job_rotator.sh