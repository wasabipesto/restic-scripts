# Some restic scripts

## Step 1. Install

Install restic:

    sudo apt install restic

Clone this:

    cd /opt
    git clone git@github.com:wasabipesto/restic-scripts.git

Set up the .env file:

    mv .env.example .env
    nano .env

(or open my own)

    git secret reveal

## Step 2. Configure

Pop open crontab:

    crontab -e

On all machines, add the backup script:

    0 2 * * * /bin/bash /opt/restic-scripts/backup.sh

On one machine, add the check and clean scripts:

    0 6 * * 0 /bin/bash /opt/restic-scripts/checkup.sh
    0 6 * * 1 /bin/bash /opt/restic-scripts/cleanup.sh

## Step 3. Sleep easy