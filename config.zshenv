# configuration file for zshenv
# path ~/.dotfiles/config.zshenv

# Brew
export BREW_HOME="/opt/homebrew"
export HOMEBREW_BUNDLE_FILE="$HOME/.dotfiles/Brewfile"

# VS Code
export CODE_HOME="/Applications/Visual Studio Code.app/Contents/Resources/app"

## Setup path
PATH="$BREW_HOME/bin:$CODE_HOME/bin:$PATH"

## FLAGS
export LDFLAGS="-L/opt/homebrew/opt/node@20/lib"
export CPPFLAGS="-I/opt/homebrew/opt/node@20/include"
