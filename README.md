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

Included is a copy of [cronic](https://habilis.net/cronic), add it to your PATH:

    sudo ln -s /opt/restic-scripts/cronic.sh /usr/bin/cronic
    # or 
    sudo cp /opt/restic-scripts/cronic.sh /usr/bin/cronic

It's suggested you add a mail agent, like so:

    sudo apt install ssmtp

And configure it like so:

    sudo nano /etc/ssmtp/ssmtp.conf

Modifying the options (for sendgrid in this case):

    mailhub=smtp.sendgrid.net:587
    AuthUser=apikey
    AuthPass=SG.whatever
    UseSTARTTLS=YES

Then you can use MAILTO and MAILFROM in cron.

## Step 2. Configure

Pop open crontab:

    crontab -e

Add your mail addresses:

    MAILTO=admin@example.com
    MAILFROM=machine@example.com

On all machines, add the backup script:

    0 2 * * * cronic /opt/restic-scripts/backup.sh

On one machine, add the check and clean scripts:

    0 6 * * 0 cronic /opt/restic-scripts/checkup.sh
    0 6 * * 1 cronic /opt/restic-scripts/cleanup.sh

## Step 3. Sleep easy