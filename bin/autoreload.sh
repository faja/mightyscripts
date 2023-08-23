#!/bin/bash -

# NOTE!
# NOTE! for simple things consider using `reflex` command instead
# NOTE! eg: reflex -r '\.yaml$' helm template xxx .
# NOTE!

FILE_MATCHER='\.yaml$'
ACTION_MATCHER=create,modify,move,delete
BATCH_TIMEOUT=0.2
COMMAND='helm template xxx .'
# for some events there are more than one event happening
# for instance if we are renaming a file there is MOVED_FROM
# and MOVED_TO events, moreover sometimes for whatever reason
# (vim writes a file twice?) there are two MODIFY events
# one immediately after another - becasue of that I
# batch all the events for ${BATCH_TIMEOUT} seconds
# hence there might be a slight delay before ${COMMAND}
# is executed

inotifywait -m -r -e ${ACTION_MATCHER} . --include ${FILE_MATCHER} --format %w%f \
  | while read -r file; do
    FILE=${file}
    while read -r -t ${BATCH_TIMEOUT} file; do
      FILE=${file}
    done
    echo "[$(date)] inotify event: $FILE changed, executing '${COMMAND}'"
    ${COMMAND}
  done
