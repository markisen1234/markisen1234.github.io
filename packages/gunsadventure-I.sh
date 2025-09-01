#!/bin/bash
B="#";R=5;HP=5;D=0;EHP=5;ED=0;M=2;EHEAL=1;HEAL=1;EB="#";ER=5;
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
ESHOOT() {
  if [[ "$EB" = "#" ]]; then
    
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
    if [[ "$HP" -eq 0]]; then
      echo "Fail"
      exit 0
    fi
    if [[ "$INPUT" = "shoot" ]]; then
      SHOOT
    fi
    if [[ "$INPUT" = "reload" ]]; then
      R
    fi
    if [[ "$INPUT" = "heal" ]]; then
      if [[ "$HEAL" -gt 0 ]]; then
        HP=$((HP + 2))
        ((HEAL--))
    fi
  done
  if [[ "$EHP" -gt 3]]; then
    for ((j=2; j>0; j--)); do
      if [[]]
    done
  else
done
