echo "*/5 * * * * $(whoami) sh ${DOTFILES_DIR}/bin/battery-alert  > /dev/null 2>&1\n" | sudo tee /etc/cron.d/battery-alert
