# HOMEMADE RESTIC UTIL
# PART 3: CLEAN IT UP

source /opt/restic-scripts/.env
restic forget --prune --keep-daily 7 --keep-weekly 5 --keep-monthly 12 --keep-yearly 75
