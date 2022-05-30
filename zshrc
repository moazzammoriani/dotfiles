# If you come from bash you might have to change your $PATH. export PATH=$HOME/bin:/usr/local/bin:$PATH Path to your oh-my-zsh installation. export ZSH="/home/moazzam/.oh-my-zsh" Set name of the theme to load --- if set to "random", it will load a random theme each time oh-my-zsh is loaded, in which case, to know which specific one was loaded, run: echo $RANDOM_THEME See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="moazzam" # Set list of themes to pick from when loading at random Setting this variable when ZSH_THEME=random will cause zsh to load a theme from this variable instead of looking in $ZSH/themes/ If set to an empty array, this variable will have no effect. ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
ZSH=/home/moazzam/.oh-my-zsh

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    )

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To enable vim-mode in the terminal
bindkey -v

# Convert the "python3" environment variable simply to "python"
alias python=python3

# Shorten command for opening file in nvim in new window
alias vimn="gnome-terminal -- nvim"

# Make the vim command open nvim 
alias ovim=vim
alias vim=nvim 

# Abbreviate the xdg-open command
alias xo=xdg-open

# To be able to call doom emacs from the terminal
export PATH="$PATH:$HOME/doom-emacs/bin/"

# Doing this to create a global directory for npm as per https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally
export PATH=~/.npm-global/bin:$PATH
#and this
NPM_CONFIG_PREFIX=~/.npm-global
[ -f "/home/moazzam/.ghcup/env" ] && source "/home/moazzam/.ghcup/env" # ghcup-env

# Adding the haskell package manager, cabal to PATH
export PATH=~/.cabal/bin:$PATH

# Adding the haskell Stack tool to PATH
export PATH=/usr/local/bin/stack:$PATH

# Adding the the Cargo Rust tool to PATH
export PATH=~/.cargo/bin:$PATH

# Adding ~/.local/bin to Path
export PATH=~/.local/bin:$PATH

# Adding sandmark to PATH
export PATH=~/sandmark:$PATH

fpath+=${ZDOTDIR:-~}/.zsh_functions

# Zsh completions
plugins=(… zsh-completions)
autoload -U compinit && compinit

# Setting xclip shortcut
alias xclip="xclip -sel clip"

# Alias for trash-cli command 
alias tp=trash-put


# ============ Config for nnn  ================

# trash (needs trash-cli) instead of delete
export NNN_TRASH=1
