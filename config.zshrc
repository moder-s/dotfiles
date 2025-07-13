# ZSHRC
# path ~/.dotfiles/config.zshrc

# >powerlevel 10k
# 
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## >zoxide
eval "$(zoxide init zsh)"
## >fzf
eval "$(fzf --zsh)"

# alias
alias ZZ=exit
alias ZQ=exit
