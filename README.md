# Dotfiles

These are my dotfiles. Created from [Atlassian's guide to creating a dotfiles repo](https://www.atlassian.com/git/tutorials/dotfiles)

## Prerequisites

- Linux or \*NIX based operating system
- `zsh` or `bash`
- `git`

## Step 1: Prepare the new system

- Create a new folder in the home directory `mkdir -p $HOME/.cfg/`
- Create a new `.gitignore` file

```bash
echo ".cfg" >> $HOME/.gitignore
```

## Step 2: Clone the dotfiles

- Clone the dotfiles to the new folder

```bash
git clone --bare https://github.com/kodjoz/doftiles.git $HOME/.cfg
```

- Create an alias for this repo

```bash
alias config=`/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME
```

- Move existing dotfiles to a backup folder

```bash
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```

- Check out the dotfile contents from the bare repository

```bash
config checkout
```

- Set up the `.gitconfig` for this repository

```bash
config config --local status.showUntrackedFiles no
```
