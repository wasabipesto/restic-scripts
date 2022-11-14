# HOMEMADE RESTIC UTIL
# PART 3: CLEAN IT UP

source /opt/restic-scripts/.env

SUBJECT="Restic: Cleanup"
OUTPUT=$( restic forget --prune --keep-daily 7 --keep-weekly 5 --keep-monthly 12 --keep-yearly 75 2>&1 )
OUTPUT=${OUTPUT//$'\n'/\\n}

curl --request POST \
  --url https://api.sendgrid.com/v3/mail/send \
  --header "Authorization: Bearer $SENDGRID_API_KEY" \
  --header 'Content-Type: application/json' \
  --data-binary @- <<EOF
{
  "personalizations": [{"to": [{"email": "$TO_EMAIL"}]}], 
  "from": {"email": "$FROM_EMAIL"}, 
  "subject": "$SUBJECT", 
  "content": [{"type": "text/plain", "value": "$OUTPUT"}]
}
EOF