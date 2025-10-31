#!/bin/bash

SCRIPTS_DIR="/var/satellite/data/github/scripts"

# List of script base names (without .bat)
SCRIPTS=("subePasoPart1" "subePasoPart2" "subePasoPart3" "subePasoPart4" "subePasoPart5" "subePasoPart6" "subePasoPart7" "subePasoPart8" "subePasoPart9" "subePasoPart10")

for script in "${SCRIPTS[@]}"; do
  echo "[INFO] $(date '+%Y-%m-%d %H:%M:%S') - Running $script.bat batch script..."
  /bin/bash ${SCRIPTS_DIR}/run_dosbox.sh "$script"
  sleep 2
done


