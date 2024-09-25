#!/bin/bash

NERD_FONT_TREE="󱁕 "
NERD_FONT_MEETING="󰤙"

get_event() {
  event=$(
    gcal-cli events \
      --exclude-all-day \
      --date-format "%Y-%m-%d %H:%M" \
      --limit 1
  )
}

display_popup() {
  tmux display-popup \
    -w50% \
    -h50% \
    -d '#{pane_current_path}' \
    gcal-cli events \
    --limit 1
}

main() {
  get_attendees
  parse_attendees
  # echo "number of attendee: $number_of_attendees"

  if (($number_of_attendees > 0)); then
    echo "#[fg=red,nobold] $NERD_FONT_MEETING"
  else
    echo "#[fg=green,nobold] $NERD_FONT_TREE"
  fi
  # Custom date format
  custom_date="2024-09-05 01:15"

  # Convert custom date to a Unix timestamp
  custom_timestamp=$(date -d "$custom_date" +"%s")

  # Get the current Unix timestamp
  current_timestamp=$(date +"%s")

  # Calculate the difference in seconds
  # difference=$((custom_timestamp - current_timestamp))
  #
  # # Convert difference to hours and minutes
  # hours=$((difference / 3600))
  # minutes=$(((difference % 3600) / 60))
  #
  # echo "Difference: $hours hours and $minutes minutes"
}

main
