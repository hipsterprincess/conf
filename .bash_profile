export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

P0=""
P1="\[\033[0;35m\]\$ \[\033[00m\]"
P1="\[\033[0;35m\]\$ \[\033[00m\]"
P2="\[\033[0;35m\]\w \$ \[\033[0m\]"
P3="\[\033[0;35m\]\u@\h \w \$ \[\033[0m\]"
P4="\[\033[0;35m\]\w \n\$ \[\033[0m\]"
P5="\[\033[0;35m\]\u@\h \w \n\$ \[\033[0m\]"
PC="\[\033[0;35m\]> \[\033[00m\]";
function p0() { export PS1=$P0; export PSS=true; }
function p1() { export PS1=$P1; export PSS=true; }
function p2() { export PS1=$P2; export PSS=true; }
function p3() { export PS1=$P3; export PSS=true; }
function p4() { export PS1=$P4; export PSS=true; }
function p5() { export PS1=$P5; export PSS=true; }
if [[ $PSS != 'true' ]] ; then export PS1=$P2; export PS2=$PC; fi

export PATH=$PATH:~/bin
export PATH=$PATH:~/devtools/autotools-bin/bin
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin/

export EDITOR=vim

alias s="source ~/.bash_profile"
alias bp="bind -p"

alias v="vim"
alias vd="vim diff"

alias t="tmux"
alias tl="tmux list-sessions"
alias td="tmux detach"
alias ta="tmux attach"
alias tlb="tmux load-buffer -"
alias tsb="tmux save-buffer -"
function ti() { tmux display-message -p '#S:#I.#P' ;}
function tn()
{ tmux rename-window $(tmux display-message -p '#{window_index}') ;}

alias ls="ls -FG"
alias l1="ls -1"
alias la="ls -A"
alias la1="la -1"
alias lal="la -l"
alias ll="ls -l"
alias lla="ll -A"
alias l=la1

alias r=ranger
alias a=ack
alias p=ccat
alias h=history
alias e=echo

function c()    { if [[ $1 == '' ]] ; then cd .. ; else cd $1 ; fi }
function mkcd() { mkdir -p $1 ; cd $1 ;}
function d()    { date +"%Y-%m-%d %H:%M" ;}
function di()   { date +"%Y-%m-%dT%H:%M:%SZ"; }

alias cmx='chmod +x'
alias py="python3.5"
alias jsonlint="py -m json.tool"
alias jl=jsonlint
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC --intf NCURSES "
alias bn='basename $(pwd)'
# Overrides: bn - multiprecision integer arithmetics

function ec() { openssl enc    -in $1 -aes-256-cbc -pass stdin; }
function dc() { openssl enc -d -in $1 -aes-256-cbc -pass stdin; }
# Overrides: ec - EC key processing
#            dc - an arbitrary precision calculator

alias ga="git add"
alias gc="git checkout"
alias gco="git commit"
alias gr="git reset"
alias gl="git log --decorate --graph --oneline --all"
alias gs="git status"
alias gb="git branch"
alias gd="git diff"
alias gd1="gd HEAD~1"
alias gd2="gd HEAD~2"
alias gd3="gd HEAD~3"
alias gsh="git show"
alias gsh1="gsh HEAD~1"
alias gsh2="gsh HEAD~2"
alias gsh3="gsh HEAD~3"

function nth() { r=$(cat) ; R=(${r}) ; echo ${R[$1]} ;}

function pre() { sed "s/^/$1/" ;}

function show-colors()
{ for i in {0..255} ; do printf "\x1b[38;5;${i}mcolour${i}\n"; done }

alias JAVA6="export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home"
alias JAVA8="export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_40.jdk/Contents/Home"
