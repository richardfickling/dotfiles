#source $HOME/.zsh_fuzzy_match/fuzzy-match.zsh
source ~/.recurlyrc
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt rmstarsilent
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt autocd
setopt PROMPT_SUBST
setopt RM_STAR_WAIT
#setopt autopushd
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dick/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# key bindings
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\ee[C" forward-word
bindkey "\ee[D" backward-word
bindkey "^H" backward-delete-word
bindkey '^R' history-incremental-search-backward
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix
# stupid debian
bindkey -M viins "\e[A" up-line-or-history
bindkey -M viins "\e[B" down-line-or-history
bindkey -M viins "\eOA" up-line-or-history
bindkey -M viins "\eOB" down-line-or-history

########## DICK'S SUPER AWESOME ZSHRC OF SUPER DUPER SPECTACULARITY ##########

##### OSX SPECIFIC OPTIONS ###################################################
if [[ $HOME == /Users/* ]]; then

    export LC_ALL=en_US.UTF-8
    alias ls='gls --color=auto'
    eval $(gdircolors -b ~/.dir_colors)

###### ARCH SPECIFIC OPTIONS ##################################################
else

    eval $(dircolors -b ~/.dir_colors)
    alias ls='ls --color=auto'

fi
###### ARCHITECTURE INDEPENDENT ###############################################

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
alias gd='git diff'
alias gs='git status'
alias ss='source ~/.zshrc'
export EDITOR=vim
export DISPLAY=:0
autoload -U colors && colors
PROMPT='%B%F{white}%c%b%F{green}$(parse_git_branch)%f • '
RPROMPT='%F{white}%*%f'

#function tt() {
#    pushd "$1" && ls;
#}
#function mdtt() {
#    mkdir -p "$1" && pushd "$1"
#}
function newc() {
    if [[ ! -f "$1" ]]; then
        cp ~/.vim/default.c "$1"
    fi
    vim "+call cursor(4, 4)" $1
}
function newby() {
    if [[ ! -f "$1" ]]; then
        cp ~/.vim/default.rb "$1"
    fi
    vim "+call cursor(4, 4)" $1
}
function newpy() {
    if [[ ! -f "$1" ]]; then
        cp ~/.vim/default.py "$1"
    fi
    vim "+call cursor(4, 4)" $1
}
function h2d() {
    printf "%d\n" "0x$1"
}
function d2h() {
    printf "%x\n" "$1"
}
function up() {
    for ((i = 0; i < $1; i += 1)); do
        cd ..
    done
}
function chpwd() {
    emulate -L zsh
    ls
}
function guest() {
    setxkbmap us && xmodmap -e "pointer = default"
}
function me() {
    setxkbmap us -variant colemak && xmodmap ~/.Xmodmap
}
function sleep() {
    echo "killall pianobar" | at now + $1 minutes
    pianobar
}
function line() {
    head -n $1 $2 | tail -n 1
}


#alias nn='popd && ls'
alias ta='tmux attach'
alias lc='tmux list-clients'
alias watch='watch --interval=.5 '
alias yc='links news.ycombinator.com'
alias md='mkdir'
alias tweet='t update $1'
alias ds='du -h -d0'
alias goom='goomwwm -cli -restart'
alias o='xdg-open'
alias ag='ag -i'
alias n='vim ~/Dropbox/notes'
#alias grep='echo "Did you mean ag?" && ag'
#set -o vi
#bind -m vi-insert "\C-l":clear-screen

if [[ ! -n $TMUX ]] ; then tmux attach ; fi
#PS1="\[\e[01;31m\]┌─[\[\e[01;35m\u\e[01;31m\]]──[\[\e[00;37m\]${HOSTNAME%%.*}\[\e[01;32m\]]:\w$\[\e[01;31m\]\n\[\e[01;31m\]└──\[\e[01;36m\]>>\[\e[0m\]"
#export PS1="\\w\$(__git_ps1 '(%s)') \$ "
export TERM=rxvt
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
stty start undef stop undef

export PATH=./node_modules/.bin:$PATH

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/usr/local/sbin # add sbin to path for rabbit
