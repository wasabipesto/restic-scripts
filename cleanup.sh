#!/bin/bash

source /opt/restic-scripts/.env
restic forget --prune --keep-daily 7 --keep-weekly 5 --keep-monthly 12 --keep-yearly 75
