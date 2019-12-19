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
plugins=(git wd)

source $ZSH/oh-my-zsh.sh

# User configuration
#
export MAGICK_HOME="/usr/local/ImageMagick-7.0.8"
export PATH="$MAGICK_HOME/bin:$PATH"
export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib/"

export PATH="$HOME/.fastlane/bin:$PATH"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH=$PATH:~/Library/Python/2.7/bin

export PATH=$PATH:~/dev/flutter/bin
export PATH=$PATH:/usr/local/Cellar/mysql@5.7/5.7.27_1/bin

source ~/.bin/tmuxinator.zsh

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

# eval "$(rbenv init -)"
# fnm
eval "$(fnm env --multi)"
export PATH="/usr/local/bin/watchman:$PATH"
alias config='/usr/bin/git --git-dir=/Users/halil/.cfg/ --work-tree=/Users/halil'
