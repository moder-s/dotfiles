# configuration file for zshenv
# path ~/.dotfiles/config.zshenv

# Brew
BREW_HOME="/opt/homebrew"

# VS Code
CODE_HOME="/Applications/Visual Studio Code.app/Contents/Resources/app"

## Setup path
PATH="$BREW_HOME/bin:$CODE_HOME/bin:$PATH"

## FLAGS
CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"
