#!/bin/bash
# Generates an AI-assisted cover letter using OpenAI API

read -p "Job title: " JOB_TITLE
read -p "Company: " COMPANY
read -p "Describe role/responsibilities: " ROLE_DESC

PROMPT="Write a concise and professional cover letter for a $JOB_TITLE position at $COMPANY. The role involves: $ROLE_DESC. My name is Will Harrison, with skills in DevOps, Full Stack, and Cybersecurity. Make it personal, confident, and 3 paragraphs long."

echo "[*] Generating cover letter via OpenAI..."

RESPONSE=$(curl -s https://api.openai.com/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d '{
    "model": "gpt-4",
    "messages": [{"role": "user", "content": "'"$PROMPT"'"}],
    "temperature": 0.7
  }' | jq -r '.choices[0].message.content')

echo "$RESPONSE" > cover_letter.txt
echo "[+] Saved to cover_letter.txt"