echo "Installing lukasnee/dotfiles..."
dotfiles_alias="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
# define a function dotfiles
dotfiles() {
    $dotfiles_alias $@
}
expected_dotfiles_remote="https://github.com/lukasnee/dotfiles.git"
if [ -d "$HOME/.dotfiles" ]; then
    if [ "$(dotfiles remote get-url origin)" = $expected_dotfiles_remote ]; then
        echo "repository '$HOME/.dotfiles' already exists."
    else
        echo "repository '$HOME/.dotfiles' already exists, but is not the expected remote."
        exit 1
    fi
else
    echo "Cloning dotfiles repository..."
    git clone --bare $expected_dotfiles_remote $HOME/.dotfiles
fi

dotfiles config --local status.showUntrackedFiles no

dotfiles checkout > /dev/null 2>&1
if [ $? = 0 ]; then
    echo "Checked out dotfiles.";
else
    conflicting_files=$(dotfiles checkout 2>&1 | egrep "^\s+" | awk {'print $1'})
    echo "Conflicting files found: $(echo $conflicting_files | tr '\n' ' ')"
    mkdir -p .dotfiles-backup
    echo "Backing up conflicting files to .dotfiles-backup/"
    for file in $conflicting_files; do
        cmd="mv $file .dotfiles-backup/"
        echo $cmd
        $cmd
    done
fi;
dotfiles checkout > /dev/null 2>&1
if [ ! $? = 0 ]; then
    echo "Error: Could not checkout dotfiles."
    exit 1
fi;

dotfiles_alias_cmd="alias dotfiles='$dotfiles_alias'"
if [ -n $BASH_VERSION ]; then
    if grep -q "$dotfiles_alias_cmd" $HOME/.bashrc; then
        echo "'dotfiles' alias already exists in '$HOME/.bashrc'"
    else
        echo "Creating 'dotfiles' alias in '$HOME/.bashrc'"
        echo $dotfiles_alias_cmd >> $HOME/.bashrc
    fi;
    cmd="source $HOME/.bashrc"
elif [ -n $ZSH_VERSION ]; then
    if grep -q "$dotfiles_alias_cmd" $HOME/.zshrc; then
        echo "'dotfiles' alias already exists in '$HOME/.zshrc'"
    else
        echo "Creating 'dotfiles' alias in '$HOME/.zshrc'"
        echo $dotfiles_alias_cmd >> $HOME/.zshrc
    fi;
    cmd="source $HOME/.zshrc"
else
    echo "Could not determine shell. Please add the following alias to your shell configuration:"
    echo $dotfiles_alias_cmd
    exit 1
fi
echo "Please source your shell configuration using '$cmd' to apply the changes to your current shell."