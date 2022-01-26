# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/halil/.oh-my-zsh

export LC_ALL=en_US.UTF-8

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git wd
  transfer
)

source $ZSH/oh-my-zsh.sh

export HISTSIZE=10000000
export HISTFILESIZE=10000000

# z for navigation
# https://github.com/rupa/z
#. /Users/halil/dev/z.sh

# User configuration
#
export MAGICK_HOME="/usr/local/ImageMagick-7.0.8"
export PATH="$MAGICK_HOME/bin:$PATH"
export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib/"

export PATH="$HOME/.fastlane/bin:$PATH"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH=$PATH:~/Library/Python/2.7/bin

export PATH=$PATH:~/dev/flutter/bin
export PATH=$PATH:/usr/local/Cellar/mysql@5.7/5.7.27_1/bin

# adding ruby paths
export PATH=/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/3.0.0/bin:$PATH

#source ~/.bin/tmuxinator.zsh

# source ~/Downloads/google-cloud-sdk/completion.zsh.inc
# source ~/Downloads/google-cloud-sdk/path.zsh.inc

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# aliases

# tmux vim colors
alias tmux="TERM=screen-256color-bce tmux"
alias simulator='open -n /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app'
alias mymeteor='~/surgery/meteor/meteor'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias tc='npm run tc'

function mgrep { grep -rnIi "$1" . --color; }
function mfind { find . -iname "$1" }

function cheat() {
  curl cht.sh/$1
}

bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Use ag for fzf to respect ignore files
# https://github.com/junegunn/fzf/issues/383#issuecomment-266884262
export FZF_DEFAULT_COMMAND='ag -g ""'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
wd() {
  . /Users/halil/bin/wd/wd.sh
}

function movtogif () {
  tempfile=.mov-to-gif-$(date +"%s").png
  ffmpeg -v quiet -stats -y -i $1 -vf fps=10,palettegen $tempfile
  ffmpeg -v quiet -stats -i $1 -i $tempfile -filter_complex "fps=10,paletteuse" "${1%.mov}.gif"
  rm $tempfile
}

function schemeopen () {
  xcrun simctl openurl booted $1
}

# https://medium.com/@GroundControl/better-git-diffs-with-fzf-89083739a9cb
function fd() {
  preview="git $@ --color=always -- {-1}"
  git $@ --name-only | fzf -m --ansi --preview $preview
}

#eval "$(rbenv init -)"

# fnm
eval "$(fnm env)"
export PATH="/usr/local/bin/watchman:$PATH"
#alias config='/usr/bin/git --git-dir=/Users/halil/.cfg/ --work-tree=/Users/halil'
alias config='/usr/bin/git -C "$HOME/.cfg"'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/halil/dev/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/halil/dev/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/halil/dev/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/halil/dev/google-cloud-sdk/completion.zsh.inc'; fi


alias rgf='rg --files | rg'
