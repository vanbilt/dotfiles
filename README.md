# dotfiles

System and application config files

```bash
git init --bare $HOME/dotfiles
alias gitbare='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

gitbare config --local init.defaultBranch master
gitbare config --local user.email aaron.vandrey@gmail.com
gitbare config --local status.showUntrackedFiles no
```

## Basic usage example

```bash
gitbare add /path/to/dotfile
gitbare commit
gitbare push
```

## Answers to Questions

[Article](https://www.atlassian.com/git/tutorials/dotfiles)

[Video](https://www.youtube.com/watch?v=tBoLDpTWVOM)
