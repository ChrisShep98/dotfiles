TODO: Create an install script to move dotfiles from original correct location to this directory then create a symlink

Example:

# Move a file in, then symlink it back. Repeat for each file
mv ~/.tmux.conf ~/Documents/Personal/Repositories/dotfiles
ln -s ~/Documents/Personal/Repositories/dotfiles/.tmux.conf ~/.

# Verfiy the symlink is correct
ls -la ~/.tmux.conf
/Users/chrisshepard/.tmux.conf -> /Users/chrisshepard/Documents/Personal/Repositories/dotfiles/.tmux.conf
