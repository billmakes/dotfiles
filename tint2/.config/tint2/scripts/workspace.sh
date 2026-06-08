#!/bin/bash
# Continuous workspace button with raised-bevel Pango markup.
# overline = top highlight, ▎ prefix = left highlight, both in hi shade.
ws_name="$1"

output_state() {
    local ws focused urgent visible bg fg hi
    ws=$(i3-msg -t get_workspaces 2>/dev/null \
        | jq -r --arg n "$ws_name" \
          '.[] | select(.name == $n) | "\(.focused) \(.urgent) \(.visible)"' 2>/dev/null)

    if [ -z "$ws" ]; then
        echo ""
        return
    fi

    read -r focused urgent visible <<< "$ws"

    if   [ "$focused" = "true" ]; then
        bg="#285577"; fg="#ffffff"; hi="#4c7899"
    elif [ "$urgent"  = "true" ]; then
        bg="#900000"; fg="#ffffff"; hi="#cc4444"
    elif [ "$visible" = "true" ]; then
        bg="#5f676a"; fg="#ffffff"; hi="#888888"
    else
        bg="#222222"; fg="#888888"; hi="#444444"
    fi

    printf '<span background="%s" overline="single" overline_color="%s"><span foreground="%s">▎</span><span foreground="%s"> %s </span></span>\n' \
        "$bg" "$hi" "$hi" "$fg" "$ws_name"
}

output_state

i3-msg -t subscribe '["workspace","output"]' -m 2>/dev/null | while IFS= read -r _; do
    output_state
done
