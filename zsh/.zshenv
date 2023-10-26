# prevent from duplicate records in path
typeset -U path

# set PATH so it includes user's local private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
  path+=("$HOME/.local/bin")
fi

# add golang binaries if go binary has been installed
_go_binary="/usr/local/go/bin/go"
if command -v $_go_binary &> /dev/null; then
  local GOROOT=$($_go_binary env GOROOT)
  local GOPATH=$($_go_binary env GOPATH)
  PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
fi

# add rust binaries if cargo has been installed
_cargo_binary="$HOME/.cargo/bin/cargo"
if command -v $_cargo_binary &> /dev/null; then
  PATH="$PATH:$HOME/.cargo/bin"
fi

# replace cat with bat for viewing manpages
if command -v bat &>/dev/null; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# languages
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

EDITOR="$(which vim)"
export EDITOR

DISABLE_AUTO_TITLE='true'
export DISABLE_AUTO_TITLE

TERM="xterm-256color"
export TERM

# zsh related
alias zshconfig="$EDITOR $ZDOTDIR/.zshrc"
alias ohmyzsh="$EDITOR $ZSH"

# replace ls with exa
if command -v exa &>/dev/null; then
  alias ls='exa --color=always --group-directories-first --icons'       # preferred listing
  alias ll='exa -alF --color=always --group-directories-first --icons'  # long format
  alias la='exa -a --color=always --group-directories-first --icons'    # all files and dirs
  alias lt='exa -aT --color=always --group-directories-first --icons'   # tree listing
  alias l.="exa -a | egrep '^\.'"                                       # show only dotfiles
fi

# replace cat with bat
if command -v bat &>/dev/null; then
  alias cat='bat --style header --style snip --style changes --style header'
fi

# common use
alias r="source ~/.zshenv && source ~/.zshrc"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
# alias ip="ip -color"
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias wget='wget -c '
alias hw='hwinfo --short'

alias grubup="sudo update-grub"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# cleanup orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

# get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

# should be the last line
export PATH
