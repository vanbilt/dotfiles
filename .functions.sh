#!/usr/bin/env bash
# shellcheck source=/dev/null

source ~/.fancy-bash.sh

PORTABLE="$HOME/portable"
LABEL=RealApps
UUID=FDF2-D33E

# override cd to change directory and then list contents
function cd {
  builtin cd "$@" && ls -al
}

# make a directory and then cd into it
function mkcd () {
  mkdir -p -- "$1" && cd -P -- "$1" || return;
}

function tilixhint () {
  echo -e "Open a new Tilix tab with the ${BOLD}tlx${NONE} command: "
  echo -e "${BLUE}tlx${NONE}"
  echo -e "  ${GREEN}-r${NONE} ${YELLOW}open in same tab, but to the right${NONE}"
  echo -e "  ${GREEN}-t${NONE} ${YELLOW}title of new tab${NONE}"
  echo -e "  ${GREEN}-d${NONE} ${YELLOW}directory to open new tab in${NONE}"
}

function supdawg () {
  # supdawg came from accidentally typing SUPDATE=(sudo apt update) a lot

  echo -e "\n  ${GREEN}EXECUTING: ${NONE}sudo apt update\n"
  UPDATE=$( sudo apt update 2>&1 )

  # no need to run any further commands if: "All packages are up to date."
  match='All packages are up to date.'
  if [[ -z "${UPDATE}" ]] || [[ $UPDATE == *$match* ]]; then
    echo -e "${CYAN}  It appears all packages are up-to-date${NONE}\n"
  else
    echo -e "${CYAN}  It appears some packages can be updated.${NONE}"
    echo -e "\n  ${GREEN}EXECUTING: ${NONE}apt list --upgradable\n"
    apt list --upgradable
  fi
}

function mount-ext {
  if lsblk -f | grep -wq $UUID; then
    echo -e "  ${GREEN}${BOLD}Successfully located${NONE} ${BLUE}${BOLD}Label${NONE}: $LABEL / ${BLUE}${BOLD}UUID:${NONE} $UUID."
    echo -e "  ${BOLD}Mounting for local use at: ${BLUE}$PORTABLE${NONE}"
    mkdir -p "$PORTABLE"
    sudo mount -t vfat -U "$UUID" "$PORTABLE" -o uid=1000,gid=1000,utf8,dmask=027,fmask=137
  else
    echo -e "  ${RED}${BOLD}Unable to locate:${NONE} $LABEL (UUID: $UUID).${NONE}"
    echo -e "  ${YELLOW}${ITALICS}If it is physically connected it needs to be disconnected and reconnected.${NONE}"
  fi
}

function umount-ext {
  sudo umount /dev/disk/by-uuid/$UUID
  sudo eject /dev/disk/by-uuid/$UUID
  echo -e "  ${BOLD}$LABEL has been unmounted and ejected.${NONE} ${GREEN}${BOLD}It is now safe to remove the device.${NONE}"
}

function webcam-config {
  # zoom 500 is closeer and 100 is further away
  V4L2_COMMANDS=(
    "v4l2-ctl --list-devices"
    "sudo v4l2-ctl -d /dev/video0 --set-ctrl=focus_automatic_continuous=true"
    "sudo v4l2-ctl -d /dev/video0 --set-ctrl=focus_absolute=0"
    "sudo v4l2-ctl -d /dev/video0 --set-ctrl=zoom_absolute=300"
    "sudo v4l2-ctl -d /dev/video0 --set-ctrl=sharpness=150"
  )

  INDEX=0
  LENGTH=${#V4L2_COMMANDS[@]}

  # no need to run any further commands if: "Cannot open device /dev/video0, exiting."
  match='Cannot open device /dev/video0, exiting.'
  if [[ -z "${V4L2_COMMANDS[INDEX]}" ]] || [[ ${V4L2_COMMANDS[INDEX]} == *$match* ]]; then
    echo -e "${CYAN}  Unable to locate a webcam${NONE}"
  else
    INDEX=1
    echo -e "${CYAN}  Webcam located - running config commands.${NONE}"
    for ((i = INDEX; i < LENGTH; i++)); do
      echo -e "  ${GREEN}${BOLD}EXECUTING:${NONE} ${V4L2_COMMANDS[i]}"
      eval "${V4L2_COMMANDS[i]}"
    done
  fi
}
