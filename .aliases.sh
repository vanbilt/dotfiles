#!/usr/bin/env bash
# shellcheck source=/dev/null

source ~/.fancy-bash.sh

DEV="$HOME/dev"
PORTABLE="$HOME/portable"
LABEL=RealApps
UUID=FDF2-D33E

# ALIAS
alias skypew='skype -d globodon'
alias skypep='skype -d gmail'

# change directory in current terminal
alias vanbilt='cd ${DEV}/vanbilt';
alias globodon='cd ~/dev/globodon';

# open new terminal tab then change directory
alias tilbilt='tlx -t vanbilt -d ${DEV}/vanbilt/'
alias tilglobo='tlx -t globodon -d ${DEV}/globodon/'
alias tildm-prev='tlx -t "dm src" -d ${DEV}/globodon/dataminer-eric-prev'
alias tildm-next='tlx -t "dm src" -d ${DEV}/globodon/dataminer-eric-next'
alias tildm-prev-ui='tlx -r -t "dm src" -d ${DEV}/globodon/dataminer-eric-prev/ui'
alias tildm-next-ui='tlx -r -t "dm src" -d ${DEV}/globodon/dataminer-eric-next/ui'

tilixhint () {
  echo -e "Open a new Tilix tab with the ${BOLD}tlx${NONE} command: "
  echo -e "${BLUE}tlx${NONE}"
  echo -e "  ${GREEN}-r${NONE} ${YELLOW}open in same tab, but to the right${NONE}"
  echo -e "  ${GREEN}-t${NONE} ${YELLOW}title of new tab${NONE}"
  echo -e "  ${GREEN}-d${NONE} ${YELLOW}directory to open new tab in${NONE}"
}

# vscode
# notes
alias notes='code ./dev/vanbilt/notes'
# projects
alias projects='code ./dev/vanbilt/projects'

# git
alias gs='git status || ls -la'
alias atgloboconfig='git config --local user.email "avandrey@globodon.com"'
alias atgithubconfig='git config --local user.email "aaron.vandrey@gmail.com"'
alias gitbare='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# override cd to change directory and then list contents
function cd {
  builtin cd "$@" && ls -al
}

# make a directory and then cd into it
function mkcd () {
  mkdir -p -- "$1" && cd -P -- "$1" || return;
}

function myip () {
  if [ "$1" == 'i' ]; then
    IP=$(hostname -I | cut -d' ' -f1);
    echo -e "${GREEN}${BOLD}Internal IP${NONE} is: ${BLUE}${BOLD}$IP";
  else
    IP=$(curl -s ipinfo.io/ip);
    echo -e "${GREEN}${BOLD}External IP${NONE} is:${BLUE}${BOLD} $IP";
  fi
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

function aliases () {
  echo -e "  ${GREEN}skypew[ork]${NONE}:     ${BOLD}${BLUE}Skype${NONE} - signed into ${ITALICS}${YELLOW}Globodon${NONE} account"
  echo -e "  ${GREEN}skypep[ersonal]${NONE}: ${BOLD}${BLUE}Skype${NONE} - signed into ${ITALICS}${YELLOW}Gmail${NONE} account"
  echo ""
  echo -e "  ${GREEN}vanbilt${NONE}:         ${BOLD}${BLUE}cd${NONE} into ${ITALICS}${YELLOW}\`/home/vanbilt/dev/vanbilt\`${NONE}"
  echo -e "  ${GREEN}globodon${NONE}:        ${BOLD}${BLUE}cd${NONE} into ${ITALICS}${YELLOW}\`/home/vanbilt/dev/globodon\`${NONE}"
  echo ""
  echo -e "  ${GREEN}tilbilt${NONE}:         New ${BOLD}${BLUE}Tilix${NONE} tab, working directory ${ITALICS}${YELLOW}\`vanbilt\`${NONE}"
  echo -e "  ${GREEN}tilglobo${NONE}:        New ${BOLD}${BLUE}Tilix${NONE} tab, working directory ${ITALICS}${YELLOW}\`globodon\`${NONE}"
  echo -e "  ${GREEN}tildm-prev${NONE}:      New ${BOLD}${BLUE}Tilix${NONE} tab, working directory ${ITALICS}${YELLOW}\`globodon/dataminer-eric-prev\`${NONE}"
  echo -e "  ${GREEN}tildm-next${NONE}:      New ${BOLD}${BLUE}Tilix${NONE} tab, working directory ${ITALICS}${YELLOW}\`globodon/dataminer-eric-next\`${NONE}"
  echo -e "  ${GREEN}tildm-prev-ui${NONE}:   ${BOLD}${BLUE}Tilix${NONE} tab in same window but to the right, working directory ${ITALICS}${YELLOW}\`globodon/dataminer-eric-prev/ui\`${NONE}"
  echo -e "  ${GREEN}tildm-next-ui${NONE}:   ${BOLD}${BLUE}Tilix${NONE} tab in same window but to the right, working directory ${ITALICS}${YELLOW}\`globodon/dataminer-eric-next/ui\`${NONE}"
  echo ""
  echo -e "  ${GREEN}gitbare${NONE}:         ${BOLD}${BLUE}git commands alias ${NONE}for bare git repo ${ITALICS}${YELLOW}\`dotfiles\`${NONE}"
  echo ""
  echo -e "  ${GREEN}cd${NONE}:              ${BOLD}${BLUE}cd && ls -al ${NONE} Change directory and list contents"
  echo -e "  ${GREEN}supdawg${NONE}:         ${BOLD}${BLUE}sudo apt update ${NONE} Then ${CYAN}apt list --upgradable${NONE} OR ${CYAN}It appears all packages are up-to-date${NONE}"
  echo -e "  ${GREEN}mkcd${NONE}:            ${BOLD}${BLUE}mkdir && cd${NONE} Make a new directory and cd into it"
  echo -e "  ${GREEN}myip${NONE}:            ${BOLD}${BLUE}myip${NONE} ${ITALICS}${YELLOW}External IP${NONE} [i] ${ITALICS}${YELLOW}Internal IP${NONE}"
  echo ""
  echo -e "  ${GREEN}mount-ext${NONE}:       ${BOLD}${BLUE}mount ${NONE} ${ITALICS}${YELLOW}/dev/sda1${NONE} to ${ITALICS}${YELLOW}~/my/external${NONE}"
  echo -e "  ${GREEN}umount-ext${NONE}:      ${BOLD}${BLUE}umount ${NONE} ${ITALICS}${YELLOW}~/my/external${NONE}"
  echo ""
  echo -e "  ${GREEN}gs${NONE}:              ${BOLD}${BLUE}git status${NONE} ${ITALICS}${YELLOW}- OR -${NONE} ${BOLD}${BLUE}ls -la${NONE}"
  echo -e "  ${GREEN}atgloboconfig${NONE}:   ${BOLD}${BLUE}git config local email to: ${NONE}${ITALICS}${YELLOW}avandrey@globodon.com${NONE}"
  echo -e "  ${GREEN}atgithubconfig${NONE}:  ${BOLD}${BLUE}git config local email to: ${NONE}${ITALICS}${YELLOW}aaron.vandrey@gmail.com${NONE}"
  echo ""
  echo -e "  ${GREEN}notes${NONE}:           ${BOLD}${BLUE}open VS Code to the notes working directory located at: ${NONE}${ITALICS}${YELLOW}~/dev/vanbilt/notes${NONE}"
  echo -e "  ${GREEN}projects${NONE}:        ${BOLD}${BLUE}open VS Code to the projects working directory located at: ${NONE}${ITALICS}${YELLOW}~/dev/vanbilt/projects${NONE}"
}
# alias notes='code ./dev/vanbilt/notes'