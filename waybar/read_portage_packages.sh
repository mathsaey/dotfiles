#!/usr/bin/bash

DATE_FILE="/var/lib/portage/last_sync"
echo "{\"text\":\"Last sync: $(cat $DATE_FILE)\"}"
