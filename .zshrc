# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"

#plugins=(fzf git git-auto-fetch git-commit tldr virtualenv direnv)

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
source $ZSH/oh-my-zsh.sh

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light 'zsh-users/zsh-autosuggestions'
zinit light 'zsh-users/zsh-syntax-highlighting'
zinit light 'zsh-users/zsh-completions'
zinit snippet OMZP::git
zinit snippet OMZP::git-auto-fetch
zinit snippet OMZP::git-commit
zinit snippet OMZP::tldr
zinit snippet OMZP::virtualenv
zinit snippet OMZP::direnv
zinit snippet OMZP::fzf

zinit snippet OMZL::git.zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZL::completion.zsh
zinit snippet OMZL::directories.zsh


# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

eval "$(zoxide init --cmd cd zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
