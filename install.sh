# Install ZSH
sudo apt install zsh
chsh -s $(which zsh)

# Install Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# Install commands
ln -s "$PWD/bin" "$HOME"

# Install command dependencies
sudo apt install xclip

# Install zshrc file
rm -f ~/.zshrc
echo "DOTFILES_DIR=$PWD\nsource \"\$DOTFILES_DIR/.zshrc\"" > ~/.zshrc

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
