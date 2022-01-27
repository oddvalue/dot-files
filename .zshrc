# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


zstyle :prezto:module:prompt theme powerlevel10k

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

function nvminit {
    if test -f ".nvmrc"; then nvm use || nvm install; fi
}

function cd {
    builtin cd $@;
    nvminit
    if test -f ".phprc"; then . .phprc; fi
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GEM_HOME=~/.ruby
export PATH="$PATH:~/.ruby/bin"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$HOME/.config/composer/vendor/bin:$HOME/bin:$PATH"

alias php56='PHP_VERSION=5.6 $DOTFILES_DIR/bin/php $@'
alias php70='PHP_VERSION=7.0 $DOTFILES_DIR/bin/php $@'
alias php73='PHP_VERSION=7.3 $DOTFILES_DIR/bin/php $@'
alias php74='PHP_VERSION=7.4 $DOTFILES_DIR/bin/php $@'
alias php80='PHP_VERSION=8.0 $DOTFILES_DIR/bin/php $@'
alias php81='PHP_VERSION=8.1 $DOTFILES_DIR/bin/php $@'

alias php5.6="php56"
alias php7.0="php70"
alias php7.3="php73"
alias php7.4="php74"
alias php8.0="php80"
alias php8.1="php81"

alias composer70="COMPOSER_PHP_VERSION=7.0 $DOTFILES_DIR/bin/composer $@"
alias composer73="COMPOSER_PHP_VERSION=7.3 $DOTFILES_DIR/bin/composer $@"
alias composer74="COMPOSER_PHP_VERSION=7.4 $DOTFILES_DIR/bin/composer $@"
alias composer80="COMPOSER_PHP_VERSION=8.0 $DOTFILES_DIR/bin/composer $@"
alias composer81="COMPOSER_PHP_VERSION=8.1 $DOTFILES_DIR/bin/composer $@"

alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'

alias dep='[ -f dep ] && php dep || php vendor/bin/dep'

alias sudop='sudo env PATH=$PATH'
alias sudovi='sudo -E vi'

if [ -z "$GIT_NAME" ]
then
      GIT_NAME="$(git config --get user.name)"
fi
alias timelog='git log --no-decorate --author=$GIT_NAME --oneline --format="- %s" --since=midnight'
alias yesterdaylog='git log --no-decorate --author=$GIT_NAME --oneline --format="- %s" --since=yesterday.midnight --until=midnight'

nvminit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Highlight the current autocomplete option
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Better SSH/Rsync/SCP Autocomplete
zstyle ':completion:*:(scp|rsync):*' tag-order ' hosts:-ipaddr:ip\ address hosts:-host:host files'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

zstyle ':completion:*:(dbdump):*' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost

# Allow for autocomplete to be case insensitive
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' \
  '+l:|?=** r:|?=**'

# Initialize the autocompletion
autoload -Uz compinit && compinit -i

backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
    zle -f kill
}
zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir

bindkey '^H' backward-kill-word
bindkey '[3;5~' kill-word
bindkey '5~' kill-word

source "$DOTFILES_DIR/autocomplete/dbdump"
