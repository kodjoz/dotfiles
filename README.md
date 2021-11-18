# Dotfiles

These are my dotfiles. Created from [Atlassian's guide to creating a dotfiles repo](https://www.atlassian.com/git/tutorials/dotfiles)

## Prerequisites

- Linux or \*NIX based operating system
- `zsh` or `bash`
- `git`

## Step 1: Prepare the new system

- Create a new folder in the home directory `mkdir -p $HOME/.cfg/`
- Create a new `.gitignore` file
- Create an `.aliases` file

```bash
mkdir -p $HOME/.cfg && echo ".cfg" >> $HOME/.gitignore \
touch $HOME/.aliases
echo "source $HOME/.aliases" >> .zshrc
```

## Step 2: Clone the dotfiles

- Create an alias for this repo
```bash
echo "alias config=`/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME" >> $HOME/.aliases
exec zsh
```

- Clone the dotfiles to the new folder
```bash
git clone --bare https://github.com/kodjoz/dotfiles.git $HOME/.cfg
```


- Move existing dotfiles to a backup folder

```bash
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
```

- Check out the dotfile contents from the bare repository

```bash
config checkout
```

- Set up the `.gitconfig` for this repository

```bash
config config --local status.showUntrackedFiles no
```

## Step 3: Set up Antibody

- Get [Antibody](https://getantibody.github.io/install/)
```bash
curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin
```

- Install plugins
```bash
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
```
