#!/usr/bin/env bash
# Finds the PID of the 4-to_infinity_and_beyond process

for pid in /proc/[0-9]*; do
  if [ -r "$pid/cmdline" ]; then
    cmd=$(tr '\0' ' ' < "$pid/cmdline")
    if [[ "$cmd" == *4-to_infinity_and_beyond* ]]; then
      echo "$(basename "$pid")"
    fi
  fi
done
