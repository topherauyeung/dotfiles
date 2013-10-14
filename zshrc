
bindkey -v

# NAVIGATION

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."


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
autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '%F{28} ☢'
zstyle ':vcs_info:*' unstagedstr '%F{11} ☠'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn
precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats ' %F{green}%b%c%u%F{blue} %m'
    } else {
        zstyle ':vcs_info:*' formats ' %F{green}%b%c%u%F{red}●%F{blue} '
    }

    vcs_info
}

setopt prompt_subst
PROMPT="%F{magenta}%~${vcs_info_msg_0_}%F{yellow}%  $ %F{grey}% "

export PATH=$PATH:/usr/local/bin:/usr/local/sbin:~/bin:/Users/amorse/.rvm/gems/ruby-2.0.0-p247/bin:/Users/amorse/.rvm/gems/ruby-2.0.0-p247@global/bin:/Users/amorse/.rvm/rubies/ruby-2.0.0-p247/bin:/Users/amorse/.rvm/bin:/Users/amorse/.rvm/bin:/Users/amorse/depot_tools:/usr/local/share/npm/bin:~/opt/adt/sdk/platform-tools:~/.git-scripts/
