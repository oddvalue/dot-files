# shellcheck disable=SC2231
for f in $DOTFILES_DIR/updates/*.sh; do
  if [ -f "$DOTFILES_DIR/updates/history/$(basename -- $f)" ]; then
    echo "Skipping $f"
  else
    echo "Running update script: $f"
    source "$f"
    touch "$DOTFILES_DIR/updates/history/$(basename -- $f)"
  fi
done
