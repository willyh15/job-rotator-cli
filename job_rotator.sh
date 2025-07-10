#!/bin/bash
# 🔍 Query remote job boards for freelance DevOps/Cyber gigs
# Just logs matching jobs for now

KEYWORDS=("DevOps" "Cybersecurity" "Remote" "Bash" "Python" "SRE" "Infrastructure")
ENDPOINT="https://remoteok.com/remote-devops-jobs.json"
OUTFILE="job_results.log"

echo "[*] Fetching jobs from RemoteOK..."
curl -s "$ENDPOINT" -o jobs.json

echo "[*] Filtering jobs for keywords: ${KEYWORDS[*]}"
> "$OUTFILE"
for word in "${KEYWORDS[@]}"; do
    jq -r --arg w "$word" '.[] | select(.position | test($w; "i")) | "\(.position) @ \(.company)\n\(.url)\n---"' jobs.json >> "$OUTFILE"
done

echo "[+] Done. Matches saved in $OUTFILE"
