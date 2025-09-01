#!/bin/bash
B="#";R=5;HP=5;D=0;EHP=5;ED=0;M=2
SHOOT() {
  if [[ "$B" = "#" ]]; then
    ((EHP--));B="-"
  else
    echo "No bullet"
  fi
}
R() {
  echo "Reloading..."
  if [ "$R" -ge 0 ]; then
    B="#";((R--))
  else
    echo "Oops, no ammo"
  fi
}
while true; do
  for ((i=2; i>0; i--)); do
    echo "STATS"
    echo '"A gun with one bullet"'
    echo "GUN:[$B]"
    echo "RESERVE:$R"
    echo "HP:$HP"
    echo "DEFENCE:$D"
    echo "ENEMY-HP:$EHP"
    echo "ENEMY-DEFENCE:$ED"
    read -p "> " INPUT
    if [ "$EHP" -eq 0 ]; then
      clear
      echo '\      / | #### ___  _____ ___ \  /'
      echo ' \    /  | #     |  |    | |__| \/'
      echo '  \  /   | #     |  |    | |\   |'
      echo '   \/    | ####  |  |____| | \  |'
      exit 0
    fi
    if [[ "$INPUT" = "shoot" ]]; then
      SHOOT
    fi
    if [[ "$INPUT" = "reload" ]]; then
      R
    fi
  done
done
