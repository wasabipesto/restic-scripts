#!/bin/bash

source /opt/restic-scripts/.env
restic check --read-data-subset=10G
