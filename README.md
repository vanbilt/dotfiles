# dotfiles

A repository of system and application configuration files.

## Initialize

In order to start from scratch, run the following command.

```bash
git init --bare $HOME/dotfiles
```

The important portion of that command is the `--bare`.

In order to not have to type out _which_ `git` and _which_ `work-tree` to use, adding the following to `~/.bashrc` or a file sourced by `~/.bashrc`:

```bash
alias gitbare='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
```

To perform the rest of the config after running `init` fun the following commands:

```bash
gitbare config --local init.defaultBranch main
# gitbare config --local user.email aaron.vandrey@gmail.com
gitbare config --local status.showUntrackedFiles no
```

However, since this has already been done once, there should be no need to run that again with this repository.

## Clone

More likely scenario is that the desire is to clone the existing repository onto a new machine. In order to do that run git clone with `--bare`, same as with the `init` command above.

```bash
git clone git@github.com:vanbilt/dotfiles.git --bare
```

As with starting from scratch, it's best to set up a `alias` for brevity when interacting with `git` and this `--bare` repository.

```bash
alias gitbare='/usr/bin/git --git-dir=$HOME/dotfiles.git --work-tree=$HOME'
```

```bash
gitbare config --local init.defaultBranch main
# gitbare config --local user.email aaron.vandrey@gmail.com
gitbare config --local status.showUntrackedFiles no
```

## Usage

Mostly interacting with a `--bare` repository is the same as when interacting with a normal `git` repository. Below is an example of one use case scenario:

```bash
gitbare add .aliases.sh
gitbare commit
gitbare push
```

### Questions

If there is a desire to do more with the `--bare` repository than what is listed above, perhaps the following links can help. The YouTube video is what I watched to get up and running the first time.

Resources: A YouTube [video](https://www.youtube.com/watch?v=tBoLDpTWVOM) and an Atlassian [article](https://www.atlassian.com/git/tutorials/dotfiles).
