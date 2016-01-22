export ZSH=~/.oh-my-zsh

ZSH_THEME="3den"
TERM=screen-256color-bce

alias pac="sudo pacman"
alias pacup="sudo pacman -Suy"
alias apti="sudo apt-get install"
alias aptup="sudo apt-get update && sudo apt-get upgrade"

alias tmux="tmux -2"

alias vim="nvim"
alias szsh="vim ~/.zshrc"
alias svim="vim ~/.vimrc"

alias mine='sudo chown -R $USER'
alias drun='docker run -it --rm'
alias cordova='drun --privileged -v /dev/bus/usb:/dev/bus/usb -v $PWD:/src cordova cordova'
alias popcorn="nvm use 0.10 && cd ~/Desktop/Work/node/popcorn && grunt start"

# Typo aliases
alias rpsec='rspec'

mkcd () {
    mkdir -p "$*"
    cd "$*"
}

cdl () {
    cd "$*"
    ls -la
}

gamend () {
    git add .
    git commit --amend
}

gamrc () {
    git add .
    git commit --amend
    git rebase --continue
}

btc () {
    curl -s http://api.coindesk.com/v1/bpi/currentprice.json | python -c "import json, sys; print(json.load(sys.stdin)['bpi']['EUR']['rate'])"
}

docker_stop () {
  docker kill $(docker ps -q)
}

docker_wipe () {
  docker kill $(docker ps -q)
  docker rm $(docker ps -a -q)
  docker rmi $(docker images -q)
  sudo ~/.oh-my-zsh/custom/docker-cleanup-volumes/docker-cleanup-volumes.sh
}

git_pull_dir () {
  CUR_DIR=$(pwd)

  echo "\n\033[1mPulling in latest changes for all repositories...\033[0m\n"

  for i in $(find . -name ".git" | cut -c 3-); do
    echo "";
    echo "\033[33m"+$i+"\033[0m";
    cd "$i";
    cd ..;

    git pull origin master;

    cd $CUR_DIR
  done

  echo "\n\033[32mComplete!\033[0m\n"
}

psql () {
  if (($# == 0)) then
    docker run -it --link postgres:postgres --rm postgres sh -c 'exec psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -U postgres'
  else
    docker run -it --link postgres:postgres --rm postgres sh -c "exec psql $*"
  fi
}

install_packages_pac () {
  pac -S zsh docker skype tmux vim the_silver_searcher xclip nodejs
  yaourt -S google-chrome atom-editor
  install_rvm
}

install_rvm () {
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  \curl -sSL https://get.rvm.io | bash -s stable<Paste> --ruby=2.3.0
}

docker_install () {
  docker run -p 5432:5432 -d --name postgres postgres
  docker run -p 6379:6379 -d --name redis redis
  docker run -p 9200:9200 -p 9300:9300 -d --name elastic elasticsearch
}

alias -s html=vim
alias -s php=vim
alias -s css=vim
alias -s js=vim
alias -s py=vim
alias -s sql=vim
alias -s cpp=vim
alias -s y=vim
alias -s c=vim
alias -s h=vim
alias -s txt=vim
alias -s log=tail

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd/mm/yyyy"

plugins=(z git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/vs/.gem/ruby/2.2.0/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# source ~/.nvm/nvm.sh
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
source ~/.rvm/scripts/rvm

### 3den red *
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$fg[white]%}"

autoload -Uz zcalc
bindkey ' ' magic-space

# # The next line updates PATH for the Google Cloud SDK.
# source '/home/btd/misc/google-cloud-sdk/path.zsh.inc'

# # The next line enables bash completion for gcloud.
# source '/home/btd/misc/google-cloud-sdk/completion.zsh.inc'
