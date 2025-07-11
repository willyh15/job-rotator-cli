#!/bin/bash
# 🔁 Fetch jobs from multiple boards and filter by keyword

KEYWORDS=("DevOps" "Cybersecurity" "Fullstack" "Frontend" "Backend" "AI" "Pen Testing")
OUTFILE="static/job_results.json"
TMPFILE="tmp_jobs.json"
mkdir -p static
echo "[]" > "$TMPFILE"

log() { echo "[*] $1"; }

# --- RemoteOK ---
log "Fetching RemoteOK..."
curl -s 'https://remoteok.com/api' | jq -c '.[] | select(.position) | {title: .position, url: .url}' >> "$TMPFILE"

# --- Hacker News (via Algolia API) ---
log "Fetching Hacker News..."
curl -s "https://hn.algolia.com/api/v1/search_by_date?tags=story,author_whoishiring" \
| jq -c '.hits[] | {title: .title, url: .url}' >> "$TMPFILE"

# --- We Work Remotely (HTML parse) ---
log "Fetching We Work Remotely..."
curl -s 'https://weworkremotely.com/categories/remote-programming-jobs' |
grep -oP '/remote-jobs/[^"]+' |
head -n 10 |
while read -r slug; do
  echo "{\"title\": \"WeWork: ${slug##*/}\", \"url\": \"https://weworkremotely.com$slug\"}" >> "$TMPFILE"
done

# --- Filter & dedupe ---
log "Filtering by keywords..."
jq -s '
  unique_by(.url) |
  map(select(.title | test("'${KEYWORDS[*]// /|}'"; "i")))
' "$TMPFILE" > "$OUTFILE"

rm "$TMPFILE"
log "Saved filtered jobs to $OUTFILE"