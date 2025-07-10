#!/bin/bash

KEYWORDS=("DevOps" "Cybersecurity" "Remote" "Bash" "Python" "SRE" "Infrastructure" "Fullstack" "Frontend" "Backend" "AI" "Pen Testing")

OUTFILE="job_results.log"
> "$OUTFILE"

# RemoteOK
echo "[*] Fetching RemoteOK jobs..."
curl -s "https://remoteok.com/remote-devops-jobs.json" -o jobs_remoteok.json
for word in "${KEYWORDS[@]}"; do
    jq -r --arg w "$word" '.[] | select(.position | test($w; "i")) | "[RemoteOK] \(.position) @ \(.company)\n\(.url)\n---"' jobs_remoteok.json >> "$OUTFILE"
done

# Hacker News Jobs (via API aggregator)
echo "[*] Fetching HN jobs..."
curl -s "https://hn.algolia.com/api/v1/search_by_date?tags=job" -o jobs_hn.json
for word in "${KEYWORDS[@]}"; do
    jq -r --arg w "$word" '.hits[] | select(.title | test($w; "i")) | "[HN] \(.title)\n\(.url)\n---"' jobs_hn.json >> "$OUTFILE"
done

# WeWorkRemotely (scrape manually, fragile)
echo "[*] Fetching WeWorkRemotely jobs..."
curl -s "https://weworkremotely.com/categories/remote-programming-jobs.rss" -o jobs_wwr.xml
grep -Eo "<title>.*</title>|<link>.*</link>" jobs_wwr.xml | sed 's/<[^>]*>//g' | paste - - | while IFS=$'\t' read -r title url; do
    for word in "${KEYWORDS[@]}"; do
        if echo "$title" | grep -iq "$word"; then
            echo -e "[WWR] $title\n$url\n---" >> "$OUTFILE"
            break
        fi
    done
done

echo "[+] Done. Matches saved in $OUTFILE"