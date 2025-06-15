#!/usr/bin/env bash
# Finds and prints the PID(s) of running 4-to_infinity_and_beyond process(es)

for pid_path in /proc/[0-9]*; do
  if [ -r "$pid_path/cmdline" ]; then
    cmdline=$(tr '\0' ' ' < "$pid_path/cmdline")
    if echo "$cmdline" | grep -q "4-to_infinity_and_beyond"; then
      echo "$(basename "$pid_path")"
    fi
  fi
done

