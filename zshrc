bindkey -v
autoload -U colors && colors

# NAVIGATION

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias vbi="vim +BundleInstall +qall"

# ALIASES

alias q="vim ~/.zshrc"
alias qq="source ~/.zshrc"

alias cp="cp -iv"
alias rm="rm -iv"
alias mv="mv -iv"
alias ls="ls -FGh"

# Use modern regexps for sed, i.e. "(one|two)", not "\(one\|two\)"
alias sed="sed -E"

alias prettyjson="python -m json.tool"
alias prettyxml="xmllint --format -"

function al { ls -t | head -n ${1:-10}; }


#  ZSH options

HISTFILE=~/.zsh_history
export HISTSIZE=1000000000000000000
export HISTFILESIZE=$HISTSIZE
export SAVEHIST=$HISTSIZE
setopt no_list_beep
setopt no_beep
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


#. /usr/bin/z.sh

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}%F{3} %F{5}%F{2}%b%F{3}|%F{1}%a%F{5}%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}%F{3} %F{5}%F{2}%b%F{5}%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[yellow]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
PROMPT=$'%F{cyan}%~ $(vcs_info_wrapper)'

export PATH=$PATH:/usr/local/bin:/usr/local/sbin:~/bin:/Users/amorse/.rvm/gems/ruby-2.0.0-p247/bin:/Users/amorse/.rvm/gems/ruby-2.0.0-p247@global/bin:/Users/amorse/.rvm/rubies/ruby-2.0.0-p247/bin:/Users/amorse/.rvm/bin:/Users/amorse/.rvm/bin:/Users/amorse/depot_tools:/usr/local/share/npm/bin:~/opt/adt/sdk/platform-tools:~/.git-scripts/
