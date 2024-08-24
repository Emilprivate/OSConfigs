# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# Custom
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias ctfsetup='python ~/Gitclones/Esd.SSR/Ctfs/Tools/ctf_setup.py'
alias ta='tmux attach'
alias f='pcmanfm'

export QT_QPA_PLATFORM=xcb

export EDITOR='vim'
export VISUAL='vim'

export PATH="$PATH:$(yarn global bin)"

eval "$(dircolors ~/.dircolors)"
