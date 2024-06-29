#!/bin/bash

source /opt/restic-scripts/.env
restic backup /home /opt --exclude-file=/opt/restic-scripts/excludes.txt
