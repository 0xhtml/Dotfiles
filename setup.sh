#!/bin/sh
cd ..
ln -sf "Dotfiles/.bash_aliases"
ln -sf "Dotfiles/.gitconfig"
ln -sf "Dotfiles/.vimrc"
cd .local/share/cura/3.1/definitions
ln -sf ../../../../../Dotfiles/cura/geeetech_a10m.def.json
cd ../extruders
ln -sf ../../../../../Dotfiles/cura/geeetech_a10m_extruder_0.def.json
ln -sf ../../../../../Dotfiles/cura/geeetech_a10m_extruder_1.def.json
