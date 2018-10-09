# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# if/else is so you can copy settings to root
if [[ $USER == "root" ]]; then
  export ZSH="/root/.oh-my-zsh"
  ZSH_THEME="bira"
else 
  export ZSH="${HOME}/.oh-my-zsh"
  ZSH_THEME="lukerandall"
fi

# set shell
export BROWSER="$(which firefox)"
export EDITOR="vi"
export VISUAL="vi"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="lukerandall"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  battery
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
fpath=(~/.zsh.d/ $fpath)

# TMUX
if which tmux >/dev/null 2>&1; then
    #if not inside a tmux session, and if no session is started, start a new session
    if [[ -n $TMUX && $TERM == "screen" ]]; then
      tmux new-session -A -s main
    fi
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias rvpn='bash ${HOME}/scripts/resetvpn.sh'
alias dvpn='bash ${HOME}/scripts/downvpn.sh'
alias cvpn='cvpn(){bash ${HOME}/scripts/changevpn.sh $(ls /etc/wireguard/ | cut -f1 -d'.' | fzf) }; cvpn'
alias hvpn='bash ${HOME}/scripts/resetvpnhome.sh'
# creates a backup of a file, then edits in vim
alias bvim='bvim(){cp "${1}" "${1}.bak" && vim "${1}"}; bvim' # backup file before vim
alias pg='ping 1.1.1.1 -c1 && curl ipinfo.io || iwconfig' # internet test
alias st='st(){curl ipinfo.io && speedtest --server $(speedtest --list | grep ")" | fzf | cut -f1 -d")" ) }; st'
alias cat='bat --plain'
alias xi='bash "${HOME}/.xinitrc"' # caps lock binding reset
alias tm='tmux new-session -A -s main'
alias root='sudo su'
alias k='su k'
alias sus='sudo pm-suspend'
alias bc='bc -q'
alias fsoc="cat ${HOME}/scripts/fsoc.ascii | nms -cas -f red"
alias update='sudo apt update && sudo apt upgrade -y'
alias pick='deepin-picker 2>1' # color picker
alias rootupdate='[[ $USER == "root" ]] && zsh /root/.cpdotfiles.sh || echo "run as root."'
alias cleandownloads='bash ${HOME}/scripts/cleandownloads.sh'
alias ga='alias | grep -v 'git' | grep -v 'cd' | grep -v 'ls' | fzf | cut -f2 -d"=" | xargs zsh -c' # get aliases
alias src='source ${HOME}/.zshrc' # sources .zshrc
alias peco='peco --initial-filter=Regexp' 
alias rdns='f(){dig +short "${1}.in-addr.arpa." PTR }; f' # reverse DNS lookup 
alias cheatpush='scp ${HOME}/.cheat/* kalivm:/root/.cheat/'
alias cheatpull='scp -r kalivm:"/root/.cheat/*" ${HOME}/.cheat'
alias zshpush='scp ${HOME}/.zshrc kalivm:/root/'
alias zshpull='scp kalivm:/root/.zshrc ${HOME}/'
alias notepush='scp ${HOME}/notes/* kalivm:/root/notes/'
alias notepull='scp kalivm:"/root/notes/*" ${HOME}/notes/'
alias cheatcp='f(){ cheat $@ | fzf | xclip -i}; f' #requires x11 forwarding
alias c='xclip -i'
alias v='xclip -o'
alias fzfc='fzf | xclip -i'
alias killer='f(){ ps -a | fzf | awk '\''{print $1}'\'' | xargs kill $@ }; f' #quick kill with fzf, takes args
alias config='/usr/bin/git --git-dir=${HOME}/.cfg/ --work-tree=${HOME}'
alias cpush='/usr/bin/git --git-dir=${HOME}/.cfg/ --work-tree=${HOME} commit -a --allow-empty-message -m "" && /usr/bin/git --git-dir=${HOME}/.cfg/ --work-tree=${HOME} push'
alias notes='cd ${HOME}/notes && ${HOME}/notes/.fuz.sh'
