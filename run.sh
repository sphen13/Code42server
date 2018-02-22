#!/bin/bash

# Start the proserver
/opt/proserver/bin/proserver start
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start proserver: $status"
  exit $status
fi

# Naive check runs checks once a minute to see if either of the processes exited.
# The container exits with an error if it detects if the process has exited.
# Otherwise it loops forever, waking up every 60 seconds

while sleep 60; do
  ps aux |grep CPServer |grep -q -v grep
  PROCESS_1_STATUS=$?
  # If the greps above find anything, they exit with 0 status
  # If they are not both 0, then something is wrong
  if [ $PROCESS_1_STATUS -ne 0 ]; then
    echo "proserver has died."
    exit -1
  fi
done
