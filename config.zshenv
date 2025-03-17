# configuration file for zshenv
# path ~/.dotfiles/config.zshenv

# Brew
BREW_HOME="/opt/homebrew"

# VS Code
CODE_HOME="/Applications/Visual Studio Code.app/Contents/Resources/app"

## Setup path
PATH="$BREW_HOME/bin:$CODE_HOME/bin:$PATH"

## FLAGS
LDFLAGS="-L/opt/homebrew/opt/node@20/lib"
CPPFLAGS="-I/opt/homebrew/opt/node@20/include"
