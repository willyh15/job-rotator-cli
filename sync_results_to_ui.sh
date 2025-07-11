#!/bin/bash
# Copies job_results.log into the SvelteKit UI as JSON

CLI_RESULTS="./job_results.log"
UI_RESULTS="./static/job_results.json"

if [[ ! -f "$CLI_RESULTS" ]]; then
  echo "❌ $CLI_RESULTS not found. Run job_rotator.sh first."
  exit 1
fi

echo "[*] Converting $CLI_RESULTS to JSON array..."
jq -Rs '
  split("\n---\n")[:-1] | 
  map({
    title: (split("\n")[0]),
    url: (split("\n")[1])
  })
' "$CLI_RESULTS" > "$UI_RESULTS"

echo "[+] Copied and converted to $UI_RESULTS"