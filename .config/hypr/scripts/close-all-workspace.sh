#!/bin/bash

# Close one workspace
# hyprctl clients -j | jq -r ".[] | select(.workspace.id == $(hyprctl activeworkspace -j | jq '.id')) | .address" | xargs -I {} hyprctl dispatch closewindow address:{}

# Close all workspace
hyprctl clients -j | jq -r '.[] | .address' | xargs -I {} hyprctl dispatch closewindow address:{}