alias php73='PHP_VERSION=73 $DOTFILES_DIR/bin/dphp $@'
alias php74='PHP_VERSION=74 $DOTFILES_DIR/bin/dphp $@'
alias php80='PHP_VERSION=80 $DOTFILES_DIR/bin/dphp $@'
alias php81='PHP_VERSION=81 $DOTFILES_DIR/bin/dphp $@'
alias php82='PHP_VERSION=82 $DOTFILES_DIR/bin/dphp $@'

alias php7.3="php73"
alias php7.4="php74"
alias php8.0="php80"
alias php8.1="php81"
alias php8.2="php82"

alias phpcs73='PHP_VERSION=7.3 $DOTFILES_DIR/bin/dphpcs $@'
alias phpcs74='PHP_VERSION=7.4 $DOTFILES_DIR/bin/dphpcs $@'
alias phpcs80='PHP_VERSION=8.0 $DOTFILES_DIR/bin/dphpcs $@'
alias phpcs81='PHP_VERSION=8.1 $DOTFILES_DIR/bin/dphpcs $@'

alias phpcbf73='PHP_VERSION=7.3 $DOTFILES_DIR/bin/dphpcbf $@'
alias phpcbf74='PHP_VERSION=7.4 $DOTFILES_DIR/bin/dphpcbf $@'
alias phpcbf80='PHP_VERSION=8.0 $DOTFILES_DIR/bin/dphpcbf $@'
alias phpcbf81='PHP_VERSION=8.1 $DOTFILES_DIR/bin/dphpcbf $@'

alias phpcpd73='PHP_VERSION=7.3 $DOTFILES_DIR/bin/dphpcpd $@'
alias phpcpd74='PHP_VERSION=7.4 $DOTFILES_DIR/bin/dphpcpd $@'
alias phpcpd80='PHP_VERSION=8.0 $DOTFILES_DIR/bin/dphpcpd $@'
alias phpcpd81='PHP_VERSION=8.1 $DOTFILES_DIR/bin/dphpcpd $@'

alias composer73="COMPOSER_PHP_VERSION=7.3 $DOTFILES_DIR/bin/dcomposer $@"
alias composer74="COMPOSER_PHP_VERSION=7.4 $DOTFILES_DIR/bin/dcomposer $@"
alias composer80="COMPOSER_PHP_VERSION=8.0 $DOTFILES_DIR/bin/dcomposer $@"
alias composer81="COMPOSER_PHP_VERSION=8.1 $DOTFILES_DIR/bin/dcomposer $@"

alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'

alias dep='[ -f dep ] && dphp dep || [ -f vendor/bin/dep ] && dphp vendor/bin/dep || [ -f vendor/bin/deployer.phar ] && dphp vendor/bin/deployer.phar'

alias sudop='sudo env PATH=$PATH'
alias sudovi='sudo -E vi'

if [ -z "$GIT_NAME" ]
then
      GIT_NAME="$(git config --get user.name)"
fi
alias timelog='git log --no-decorate --author=$GIT_NAME --oneline --format="- %s" --since=midnight'
alias yesterdaylog='git log --no-decorate --author=$GIT_NAME --oneline --format="- %s" --since=yesterday.midnight --until=midnight'

alias ds="rsync -avzh --exclude '.git' --exclude 'storage' --exclude '.env' --exclude '.idea' --exclude 'node_modules' --exclude '.docker' --exclude 'bootstrap/cache/livewire-components.php' ~/Projects/tmstores ec2-user@dev:/home/"
alias dsd="ds --delete --ignore-errors"

alias dst="rsync -avzh --exclude '.git' --exclude 'storage' --exclude '.env' --exclude '.idea' --exclude 'node_modules' --exclude '.docker' --exclude 'bootstrap/cache/livewire-components.php' ~/Projects/tmstores-testing/ ec2-user@dev:/home/tmstores"
alias dstd="dst --delete --ignore-errors"

alias dockerssh="docker exec -it tmstores_web /bin/bash"

alias mcomposer="COMPOSER_MEMORY_LIMIT=-1 composer"

alias nordd="nordlayer disconnect"

alias da="docker exec -it -u $(id -u) tmstores_web php artisan"

alias pint="./vendor/bin/pint"
alias phpstan="./vendor/bin/phpstan"

alias wtf="which"
