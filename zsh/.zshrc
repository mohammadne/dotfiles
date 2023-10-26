# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -------------------------------------------------------------- Plugins

ZSH_THEME="powerlevel10k/powerlevel10k" # set theme

# list of all plugins: https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
plugins=(
  # zsh-users plugins
  history-substring-search # ZSH port of Fish history search. Begin typing command, use up arrow to select previous use
  zsh-autosuggestions # Suggests commands based on your history
  zsh-completions # More completions
  zsh-syntax-highlighting # Fish shell like syntax highlighting for Zsh
  
  # theming
  colored-man-pages
  
  # development plugins
  git docker kubectl ansible vagrant
  
  # programming languages
  golang python rust
)

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8' # Colorize autosuggest

# https://github.com/zsh-users/zsh-autosuggestions/issues/351
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(bracketed-paste accept-line)

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}

zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

autoload -U compinit && compinit # reload completions for zsh-completions

# -------------------------------------------------------------- Configuration

export ZSH="$ZDOTDIR/ohmyzsh"

source $ZSH/oh-my-zsh.sh # required to load oh-my-zsh
source $ZDOTDIR/.zshfunc # required to load functions

# To customize prompt, run `p10k configure` or edit p10k.zsh file manually
[[ ! -f "$ZDOTDIR/p10k.zsh" ]] || source "$ZDOTDIR/p10k.zsh"

HISTFILE="$ZDOTDIR/.zsh_history"
# HISTSIZE=1000
# SAVEHIST=1000
