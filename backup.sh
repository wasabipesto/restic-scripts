# HOMEMADE RESTIC UTIL
# PART 1: BACK IT UP

source /opt/restic-scripts/.env
restic backup /home /opt --exclude-file=/opt/restic-scripts/excludes.txt
