# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory where we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"

# Download zinit if it's not already installed
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

# Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add snippets
zinit snippet OMZP::git
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::sudo

# Load completions
autoload -Uz compinit && compinit

# Autosuggestions color
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#4e4e4f'

# Snipplets evaluation
zinit cdreplay -q

# Load p10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# History
HISTSIZ=20000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZ
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle 'completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias vim="nvim"
alias cat="bat"
alias setup="~/Documents/setup/setup.sh"
alias char="ssh armleth@charybdis.stockly.tech -p 23"
alias f='cd $(fd --type d --hidden \
    --exclude .java \
    --exclude .cargo \
    --exclude .rustup \
    --exclude .emacs.d \
    --exclude .pex \
    --exclude .cabal \
    --exclude .dotnet \
    --exclude .vscode \
    --exclude .git \
    --exclude node_module \
    --exclude .cache \
    --exclude .npm \
    --exclude .mozilla \
    --exclude .meteor \
    --exclude .nv \
    --exclude .jupyter \
    --exclude .ssh \
    --exclude .gnupg \
    --exclude .nix-defexpr \
    --exclude .powerlevel10k \
    --exclude .docker \
    --exclude .pki \
    --exclude .ipython \
    --exclude .steam \
    --exclude .local \
    --exclude .opam \
    | fzf --preview="ls --color {}")'

# Shell integrations
# eval "$(fzf --zsh)"

# Add JBang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
