#!/bin/bash

curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh

sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R

spicetify config spotify_path /opt/spotify
spicetify config prefs_path ~/.config/spotify/prefs

spicetify backup apply

spicetify apply
