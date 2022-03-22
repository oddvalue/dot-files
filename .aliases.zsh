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

alias phpcs56='PHP_VERSION=5.6 $DOTFILES_DIR/bin/phpcs $@'
alias phpcs70='PHP_VERSION=7.0 $DOTFILES_DIR/bin/phpcs $@'
alias phpcs73='PHP_VERSION=7.3 $DOTFILES_DIR/bin/phpcs $@'
alias phpcs74='PHP_VERSION=7.4 $DOTFILES_DIR/bin/phpcs $@'
alias phpcs80='PHP_VERSION=8.0 $DOTFILES_DIR/bin/phpcs $@'
alias phpcs81='PHP_VERSION=8.1 $DOTFILES_DIR/bin/phpcs $@'

alias phpcbf56='PHP_VERSION=5.6 $DOTFILES_DIR/bin/phpcbf $@'
alias phpcbf70='PHP_VERSION=7.0 $DOTFILES_DIR/bin/phpcbf $@'
alias phpcbf73='PHP_VERSION=7.3 $DOTFILES_DIR/bin/phpcbf $@'
alias phpcbf74='PHP_VERSION=7.4 $DOTFILES_DIR/bin/phpcbf $@'
alias phpcbf80='PHP_VERSION=8.0 $DOTFILES_DIR/bin/phpcbf $@'
alias phpcbf81='PHP_VERSION=8.1 $DOTFILES_DIR/bin/phpcbf $@'

alias phpcpd56='PHP_VERSION=5.6 $DOTFILES_DIR/bin/phpcpd $@'
alias phpcpd70='PHP_VERSION=7.0 $DOTFILES_DIR/bin/phpcpd $@'
alias phpcpd73='PHP_VERSION=7.3 $DOTFILES_DIR/bin/phpcpd $@'
alias phpcpd74='PHP_VERSION=7.4 $DOTFILES_DIR/bin/phpcpd $@'
alias phpcpd80='PHP_VERSION=8.0 $DOTFILES_DIR/bin/phpcpd $@'
alias phpcpd81='PHP_VERSION=8.1 $DOTFILES_DIR/bin/phpcpd $@'

alias composer70="COMPOSER_PHP_VERSION=7.0 $DOTFILES_DIR/bin/composer $@"
alias composer73="COMPOSER_PHP_VERSION=7.3 $DOTFILES_DIR/bin/composer $@"
alias composer74="COMPOSER_PHP_VERSION=7.4 $DOTFILES_DIR/bin/composer $@"
alias composer80="COMPOSER_PHP_VERSION=8.0 $DOTFILES_DIR/bin/composer $@"
alias composer81="COMPOSER_PHP_VERSION=8.1 $DOTFILES_DIR/bin/composer $@"

alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'

alias dep='[ -f dep ] && php dep || [ -f vendor/bin/dep ] && php vendor/bin/dep || [ -f vendor/bin/deployer.phar ] && php vendor/bin/deployer.phar'

alias sudop='sudo env PATH=$PATH'
alias sudovi='sudo -E vi'

if [ -z "$GIT_NAME" ]
then
      GIT_NAME="$(git config --get user.name)"
fi
alias timelog='git log --no-decorate --author=$GIT_NAME --oneline --format="- %s" --since=midnight'
alias yesterdaylog='git log --no-decorate --author=$GIT_NAME --oneline --format="- %s" --since=yesterday.midnight --until=midnight'
