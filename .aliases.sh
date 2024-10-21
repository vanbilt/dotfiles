#!/usr/bin/env bash
# shellcheck source=/dev/null

source ~/.fancy-bash.sh

DEV="$HOME/dev"

# ALIAS
alias npr='npm run'

# change directory in current terminal
alias vanbilt='cd ${DEV}/vanbilt'
alias globodon='cd ${DEV}/globodon'

# open new terminal tab then change directory
alias tilbilt='tilix -a app-new-session -t "VANBILT" -w ${DEV}/vanbilt/'
alias tilglobo='tilix -a app-new-session -t "GLOBODON" -w ${DEV}/globodon/'
alias tildm-prev='tilix -a app-new-session -t "DM SRC" -w ${DEV}/globodon/dataminer-eric-prev'
alias tildm-next='tilix -a app-new-session -t "DM SRC" -w ${DEV}/globodon/dataminer-eric-next'
alias tildm-prev-ui='tilix -a session-add-right -t "DM SRC UI" -w ${DEV}/globodon/dataminer-eric-prev/ui'
alias tildm-next-ui='tilix -a session-add-right -t "DM SRC UI" -w ${DEV}/globodon/dataminer-eric-next/ui'

# launch vscode with the working directory set
alias notes='code ${DEV}/vanbilt/notes'
alias haversack='code ${DEV}/vanbilt/haversack'
alias javascripties='code ${DEV}/vanbilt/javascripties'

# git
alias gs='git status || ls -1 --group-directories-first'
alias gss='git status -s || -1  --group-directories-first'
alias atgloboconfig='git config --local user.email "avandrey@globodon.com"'
alias atgithubconfig='git config --local user.email "aaron.vandrey@gmail.com"'
alias gitbare='/usr/bin/git --git-dir=$HOME/dotfiles.git --work-tree=$HOME'

function aliases () {
  echo -e "  ${GREEN}skype${NONE}:          ${BOLD}${BLUE}Skype${NONE} - menu for choosing ${ITALICS}${YELLOW}Skype${NONE} account"
  echo ""
  echo -e "  ${GREEN}vanbilt${NONE}:        ${BOLD}${BLUE}cd${NONE} into ${ITALICS}${YELLOW}\`/home/vanbilt/dev/vanbilt\`${NONE}"
  echo -e "  ${GREEN}globodon${NONE}:       ${BOLD}${BLUE}cd${NONE} into ${ITALICS}${YELLOW}\`/home/vanbilt/dev/globodon\`${NONE}"
  echo ""
  echo -e "  ${GREEN}tilbilt${NONE}:        New ${BOLD}${BLUE}Tilix${NONE} tab, working directory ${ITALICS}${YELLOW}\`vanbilt\`${NONE}"
  echo -e "  ${GREEN}tilglobo${NONE}:       New ${BOLD}${BLUE}Tilix${NONE} tab, working directory ${ITALICS}${YELLOW}\`globodon\`${NONE}"
  echo -e "  ${GREEN}tildm-prev${NONE}:     New ${BOLD}${BLUE}Tilix${NONE} tab, working directory ${ITALICS}${YELLOW}\`globodon/dataminer-eric-prev\`${NONE}"
  echo -e "  ${GREEN}tildm-next${NONE}:     New ${BOLD}${BLUE}Tilix${NONE} tab, working directory ${ITALICS}${YELLOW}\`globodon/dataminer-eric-next\`${NONE}"
  echo -e "  ${GREEN}tildm-prev-ui${NONE}:  ${BOLD}${BLUE}Tilix${NONE} tab in same window but to the right, working directory ${ITALICS}${YELLOW}\`globodon/dataminer-eric-prev/ui\`${NONE}"
  echo -e "  ${GREEN}tildm-next-ui${NONE}:  ${BOLD}${BLUE}Tilix${NONE} tab in same window but to the right, working directory ${ITALICS}${YELLOW}\`globodon/dataminer-eric-next/ui\`${NONE}"
  echo ""
  echo -e "  ${GREEN}gitbare${NONE}:        ${BOLD}${BLUE}git commands alias ${NONE}for bare git repo ${ITALICS}${YELLOW}\`dotfiles\`${NONE}"
  echo ""
  echo -e "  ${GREEN}cd${NONE}:             ${BOLD}${BLUE}cd && ls -al ${NONE} Change directory and list contents"
  echo -e "  ${GREEN}supdawg${NONE}:        ${BOLD}${BLUE}sudo apt update ${NONE} Then ${CYAN}apt list --upgradable${NONE} OR ${CYAN}It appears all packages are up-to-date${NONE}"
  echo -e "  ${GREEN}mkcd${NONE}:           ${BOLD}${BLUE}mkdir && cd${NONE} Make a new directory and cd into it"
  echo -e "  ${GREEN}myip${NONE}:           ${BOLD}${BLUE}myip${NONE} ${ITALICS}${YELLOW}External IP${NONE} [i] ${ITALICS}${YELLOW}Internal IP${NONE}"
  echo ""
  echo -e "  ${GREEN}webcam-config${NONE}:  ${BOLD}${BLUE}config webcam at ${NONE} ${ITALICS}${YELLOW}/dev/video0${NONE} to ${ITALICS}${YELLOW}focus, zoom, and sharpness${NONE}"
  echo ""
  echo -e "  ${GREEN}mount-ext${NONE}:      ${BOLD}${BLUE}mount ${NONE} ${ITALICS}${YELLOW}/dev/sda1${NONE} to ${ITALICS}${YELLOW}~/my/external${NONE}"
  echo -e "  ${GREEN}umount-ext${NONE}:     ${BOLD}${BLUE}umount ${NONE} ${ITALICS}${YELLOW}~/my/external${NONE}"
  echo ""
  echo -e "  ${GREEN}gs${NONE}:             ${BOLD}${BLUE}git status${NONE} ${ITALICS}${YELLOW}- OR -${NONE} ${BOLD}${BLUE}ls -la${NONE}"
  echo -e "  ${GREEN}atgloboconfig${NONE}:  ${BOLD}${BLUE}git config local email to: ${NONE}${ITALICS}${YELLOW}avandrey@globodon.com${NONE}"
  echo -e "  ${GREEN}atgithubconfig${NONE}: ${BOLD}${BLUE}git config local email to: ${NONE}${ITALICS}${YELLOW}aaron.vandrey@gmail.com${NONE}"
  echo ""
  echo -e "  ${GREEN}notes${NONE}:          ${BOLD}${BLUE}open VS Code to the notes working directory located at: ${NONE}${ITALICS}${YELLOW}${DEV}/vanbilt/notes${NONE}"
  echo -e "  ${GREEN}projects${NONE}:       ${BOLD}${BLUE}open VS Code to the projects working directory located at: ${NONE}${ITALICS}${YELLOW}${DEV}/vanbilt/projects${NONE}"
}
