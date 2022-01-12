# Dotfiles for [@lukasnee](https://github.com/lukasnee)

Repo logistics based on this neat [guide](https://www.atlassian.com/git/tutorials/dotfiles).

## Requirements

- Git
- Curl

## Install

Install dotfiles tracking in your $HOME by running:

    git init --bare $HOME/.dotfiles
    echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
    source ~/.bashrc
    dotfiles config --local status.showUntrackedFiles no
    curl -Lks https://raw.githubusercontent.com/lukasnee/dotfiles/main/.bin/install.sh | /bin/bash

> **NOTE:** During installation you created alias `dotfiles` - use it instead of `git` in your `$HOME` directory because it's not a normal repository.


# Useful

## Shell Tricks
Generate a random data file of given size in bytes  
```shell
$ head -c 1024 /dev/urandom > 1KB.dat
```

## Regex Tricks

## Match block between HEAD and TAIL that in between contains a PATTERN
```regex
(?m)HEAD(?:(?!HEAD)[\s\S])+(PATTERN)[\s\S]+?(?=TAIL)
```
