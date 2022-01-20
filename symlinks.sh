# Install commands
ln -sf "$PWD/bin" "$HOME"
sudo chmod 770 $DOTFILES_DIR/bin/*

# Install VIM presets
ln -sf "$PWD/.vimrc" "$HOME/.vimrc"
ln -sf "$PWD/.vim" "$HOME/.vim"
