#!/bin/bash
# Sync CLI job results with static HTML UI frontend

echo "[*] Syncing job_results.json to /ui directory..."

cp ~/job-rotator-cli/job_results.json ~/job-rotator-cli/ui/job_results.json

if [ $? -eq 0 ]; then
  echo "[+] Sync complete: job_results.json is now available at /ui/job_results.json"
else
  echo "[!] Failed to sync job_results.json"
fi