#!/bin/sh
DIR=$(pwd)
cd $HOME
ln -sf $DIR/.bash_aliases
ln -sf $DIR/.gitconfig
ln -sf $DIR/.vimrc
cd .local/share/cura/3.1/definitions
ln -sf $DIR/cura/geeetech_a10m.def.json
cd ../extruders
ln -sf $DIR/cura/geeetech_a10m_extruder_0.def.json
ln -sf $DIR/cura/geeetech_a10m_extruder_1.def.json
