#!/usr/bin/bash

GLOB=~/.local/mail/*/Inbox/new

while true ; do
  count=$(find $GLOB -type f | wc -l)
  if [[ -z count ]] ; then
    echo "{}"
  else
    tooltip="unread mails:\t$count\r"
    for box in $GLOB ; do
      name=${box#~/.local/mail/}
      name=${name%/Inbox/new}
      new=$(ls $box | wc -l)
      if [[ $new -gt 0 ]] ; then
        tooltip="$tooltip  $name:\t$new\r"
      fi
    done
    tooltip=${tooltip%\\r}

    echo "{\"text\": \"  $count\", \"tooltip\": \"$tooltip\"}"
  fi
  inotifywait --event move,create,delete $GLOB > /dev/null 2>&1
done
