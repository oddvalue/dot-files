echo "* * * * * $(whoami) sh ${DOTFILES_DIR}/bin/battery-protect  > /dev/null 2>&1\n" | sudo tee /etc/cron.d/battery-protect
