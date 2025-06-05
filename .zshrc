# コマンドプロンプト設定
PROMPT="%F{blue}rtosa%f:%B%F{blue}%~%f%b$ "

# alias
alias vi='nvim'
alias ls='ls -AFG'
alias ll='ls -hlt'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ..='cd ..'
alias history='history -Di'

# zsh-comletions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
	source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  autoload -Uz compinit && compinit
fi

# History Settings
setopt share_history # 複数のZshセッション間でコマンド履歴を共有する
HISTSIZE=1000 # シェルセッションで保持できる履歴の数
HISTFILE=~/.zsh_history # コマンド履歴を保存するファイル
SAVEHIST=100000 # 保存する履歴の最大数

# Shell Options
setopt nonomatch # ワイルドカードパターンが一致しない場合、そのまま文字列として扱う
setopt correct # コマンドのスペルミスを検出し、修正を提案

# Completion System
autoload -Uz compinit && compinit # 自動補完機能を有効

# Key Bindings
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# Version Control System Integration (Gitの情報を表示)
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '[%F{yellow}%b%f]%u%c'
zstyle ':vcs_info:git:*' actionformats '[%b|%a]'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr ":%F{green}!%f"
zstyle ':vcs_info:git:*' unstagedstr ":%F{red}+%f"

# pyenv 初期化用
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/rtosa/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
