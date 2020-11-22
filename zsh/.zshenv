#### Meta ####

# Encoding
if [[ -z "$__CF_USER_TEXT_ENCODING" ]]
then
  export __CF_USER_TEXT_ENCODING="0x0:0x3"
fi

# Language
if [[ -z "$LANG" ]]
then
  export LANG='en_US.UTF-8'
fi


#### Search Paths ####

# Shell
export PATH="$PATH:$HOME/Dev/Shell/bin"

# C
export PATH="$PATH:$HOME/Dev/C/bin"

# C++ 
export BOOST_ROOT='/usr/local/opt/boost'

# Python
export PATH="$PATH:/Library/Frameworks/Python.framework/Versions/3.6/bin"

# Go
export GOPATH="$HOME/Dev/go"
export PATH="$PATH:$GOPATH/bin"

path=(
  /usr/local/{bin,sbin}
  {~,$HOME}/bin
  $path
)

# Remove duplicates from path arrays
typeset -gU cdpath fpath mailpath path


#### Programs ####

# Editors
export BROWSER="open"
export EDITOR="vi -e"
export PAGER='less'
export VISUAL='vim'

# Less
export LESS='-F -g -i -M -R -S -w -X -z-4'  # set default options
if (( $#commands[(i)lesspipe(|.sh)] ))  # set input preprocessor
then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# FZF
alias vf='vim $(fzf)'
export FZF_DEFAULT_COMMAND='rg --files'
