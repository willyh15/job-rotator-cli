#!/bin/bash
# Sync CLI job results with SvelteKit UI frontend
# Assumes job-rotator-cli and job-rotator-ui live in ~/

echo "[*] Copying job_results.json to frontend static folder..."
cp ~/job-rotator-cli/job_results.json ~/job-rotator-cli/static/job_results.json 2>/dev/null
cp ~/job-rotator-cli/job_results.json ~/job-rotator-ui/static/job_results.json

echo "[+] Copied. Ready to serve from /job_results.json"