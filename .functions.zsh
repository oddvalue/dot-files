function nvminit {
  if test -f ".nvmrc"; then nvm use || nvm install; fi
}

function cd {
  builtin cd $@;
  nvminit
}

gcbteam() {
   git checkout -b $1
   git add *
   git commit -m "$2"
   git push --set-upstream origin "$1"
   gh pr create --reviewer townsendmusic/team --fill
}
aliasgcteam() {
  git commit -m "$1"
  git push -u origin HEAD
  gh pr create --reviewer townsendmusic/team --fill
}

gitclean() {
 git fetch -p && for branch in `git branch -vv --no-color | grep ': gone]' | awk '{print $1}'`; do git branch -D $branch; done
}

tmsync() {
  while inotifywait -r -e modify,create,delete ./; do
    dsd && ssh dev "cd /home/tmstores && sudo chown ec2-user:apache bootstrap/cache && sudo chmod 775 bootstrap/cache"
  done
}

tmsynct() {
  while inotifywait -r -e modify,create,delete ./; do
    dstd && ssh dev "cd /home/tmstores && sudo chown ec2-user:apache bootstrap/cache && sudo chmod 775 bootstrap/cache"
  done
}

deva() {
  ssh dev "cd /home/tmstores && php artisan $@"
}

ondev() {
  ssh dev "cd /home/tmstores && $@"
}

fixcache() {
  ssh dev "cd /home/tmstores && sudo chown -R ec2-user:apache ./storage && sudo chmod -R 775 ./storage"
}

tm() {
  if test -f "tm"; then
    bash ./tm $@;
  elif [ $# -eq 0 ]; then
    cd ~/Projects/tmstores || exit
  else
    echo 'tm not found'
  fi
}

_repeat() {
  for i in $(seq 1 $1); do
    echo "#${i}"
    ${@:2}
  done
}
alias repeat='_repeat'

_repeatTillFail() {
  for i in $(seq 1 $1); do
    echo "Attempt #${i}"
    ${@:2}

    if [ $? -ne 0 ]; then
        break 1
    fi
  done
}
alias repeat-till-fail='_repeatTillFail'
