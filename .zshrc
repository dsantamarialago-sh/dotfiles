# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}


# --------------------
# Module configuration
# --------------------

#
# completion
#

# Set a custom path for the completion dump file.
# If none is provided, the default ${ZDOTDIR:-${HOME}}/.zcompdump is used.
#zstyle ':zim:completion' dumpfile "${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=10'

# ------------------
# Initialize modules
# ------------------

if [[ ${ZIM_HOME}/init.zsh -ot ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
#source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#
#source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# }}} End configuration added by Zim install

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Theme
ZSH_THEME=powerlevel10k/powerlevel10k

# ENV VARIABLES
export PATH=$PATH:~/repos/sh/devtools:~/repos/myscripts

# TERMINAL ALIASES
alias ..="cd .."
alias cdsh="cd ~/repos/sh"
alias cdmio="cd ~/repos/mio"
alias untar="tar -zxvf "
alias ls="ls -lahFG"
alias ll="ls -lahG"
alias la="ls -lahG"
alias df="df -H"
alias du="du -ch"
alias mv="mv -v "
alias cp="cp -v "
alias rm="rm -vi "
alias grep="grep --color "
alias fd="find . -type d -name"
alias ff="find . -type f -name"
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias ippub="dig +short myip.opendns.com @resolver1.opendns.com"
alias randpass="openssl rand -base64 20"
alias aliases="cat ~/.zshrc | grep alias | sort"
alias mvntest="mvn test -projects tests -Pfunctests -Dtest.platform.dbUsers.dev=/dev/citools/passwd.dat -Dtest.platform.ssl.cert.verification.enabled=false -Djsse.enableSNIExtension=false -DENV=slce009"
alias mvntest69="mvn test -projects tests -Pfunctests -Dtest.platform.dbUsers.dev=/dev/citools/passwd.dat -Dtest.platform.ssl.cert.verification.enabled=false -Djsse.enableSNIExtension=false -Dmaven.wagon.http.ssl.insecure=true -DENV=slcq069"
alias mvntest1="mvn test -projects tests -Pfunctests -Dtest.platform.dbUsers.dev=/dev/citools/passwd.dat -Dtest.platform.ssl.cert.verification.enabled=false -Djsse.enableSNIExtension=false -Dmaven.wagon.http.ssl.insecure=true -DENV=slce001"
alias mvn="mvn -Dmaven.wagon.http.ssl.insecure=true -Dtest.platform.ssl.cert.verification.enabled=false -Dmaven.wagon.http.ssl.ignore.validity.dates=true"

# GIT ALIASES
alias git-log='git log --graph --pretty="format:%C(yellow)%h%Cred%d%Creset %s %C(green)(%ar) %C(cyan)%an%Creset"'
alias gitlog=git-log
alias glog=git-log
alias gitaliases="git alias "

# History
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# Changing directories
setopt auto_cd
setopt auto_pushd
unsetopt pushd_ignore_dups
setopt pushdminus

# Completion
setopt auto_menu
setopt always_to_end
setopt complete_in_word
unsetopt flow_control
unsetopt menu_complete
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# Other
setopt prompt_subst


source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

plugins=(zsh-completions syntax-highlighting history-substring-search zsh-autosuggestions)
autoload -U compinit && compinit
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/davidsantamarialago/repos/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/davidsantamarialago/repos/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/davidsantamarialago/repos/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/davidsantamarialago/repos/google-cloud-sdk/completion.zsh.inc'; fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/davidsantamarialago/.sdkman"
[[ -s "/Users/davidsantamarialago/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/davidsantamarialago/.sdkman/bin/sdkman-init.sh"