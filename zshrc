#. /usr/bin/z.sh

bindkey -v
autoload -U colors && colors
autoload -U compinit; compinit

export NODE_PATH=/usr/local/bin/node

# Default completion style is quite plain and ugly. If you want to improve its appearance, enter the following commands:
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*' completer _complete _ignored _files
zle -C complete-file complete-word _generic
zstyle ':completion:complete-file::::' completer _files
zstyle ':completion:*' verbose yes
bindkey '^xF' complete-file


# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD
# 10 second wait if you do something that will delete everything.  I wish I'd had this before...
setopt RM_STAR_WAIT

# Better and moving
alias rmd='rm -rf'
alias cpd='cp -r'

# Jump into directory and run ls.
c() { cd $@; ls }

# NAVIGATION

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias g=git
alias h=history

alias -s html=vim
alias -s css=vim
alias -s scss=vim
alias -s hbs=vim
alias -s rb=vim
alias -s py=vim

alias ff="find / -type f -name"
alias f.="find . -type f -name"

alias vbi="vim +BundleInstall +qall" # This installs all vim plugins via vundle

# ALIASES

alias q="vim ~/.zshrc"
alias qq="source ~/.zshrc"

alias cp="cp -iv"
alias rm="rm -iv"
alias mv="mv -iv"
# Colorize output, add file type indicator, and put sizes in human readable format
alias ls='ls -GFh'
# Same as above, but in long listing format
alias ll='ls -GFhl'
alias l='ls -Gfoa'

# Use modern regexps for sed, i.e. "(one|two)", not "\(one\|two\)"
alias sed="sed -E"

alias prettyjson="python -m json.tool"
alias prettyxml="xmllint --format -"

function al { ls -t | head -n ${1:-10}; }


#  ZSH options

HISTFILE=~/.zsh_history
export HISTSIZE=100000
export HISTFILESIZE=$HISTSIZE
export SAVEHIST=$HISTSIZE
setopt no_list_beep
setopt no_beep
setopt auto_list
setopt MENU_COMPLETE
setopt appendhistory
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt autocd
setopt prompt_subst
setopt autopushd

unsetopt correctall
# Allow [ or ] whereever you want
# (Prevents "zsh: no matches found: ...")
unsetopt nomatch

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{yellow}% * '
zstyle ':vcs_info:*' unstagedstr '%F{red}% * '
zstyle ':vcs_info:*' actionformats \
    '%F{5}%F{3} %F{5}%F{2}%b%F{3}|%F{1}%a%F{5}%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}%F{3} %F{5}%F{2}%b%F{5}%f %m%u%c '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r %m%u%c '

zstyle ':vcs_info:*' enable git

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[yellow]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
PROMPT=$'%{$fg[yellow]%}$[HISTCMD-1] %F{cyan}%~ $(vcs_info_wrapper) %F{magenta}% \n$ %{$reset_color%}'

export PATH=$PATH:/usr/local/bin:/usr/local/sbin:~/bin:/usr/local/lib/node_modules/npm/bin:/usr/local/lib/node_modules

