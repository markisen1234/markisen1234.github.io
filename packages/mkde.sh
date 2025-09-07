#!/bin/bash
zenity --info --title="===MKDE===" --text="Starting MKDE..."
if [ -e $HOME/mkde/main ]; then
  $HOME/mkde/main.sh
fi
