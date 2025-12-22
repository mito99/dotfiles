# cdrを有効にするための設定
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# 履歴を保存する件数や、同じディレクトリを重複させない設定
zstyle ':chpwd:*' recent-dirs-max 100
zstyle ':chpwd:*' recent-dirs-default yes

function peco-select-history() {
  BUFFER=$(history -n 1 | tac | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# ~/.zshrc.d/peco.zsh などへ追記
function peco-cdr () {
  local selected_dir=$(cdr -l | awk '{print $2}' | peco)
  if [ -n "$selected_dir" ]; then
    # ${(Q)~変数名} と書くことで、チルダ展開を強制します
    cd ${(Q)~selected_dir}
  fi
  zle reset-prompt  # 画面の崩れを防ぐため追加
}
zle -N peco-cdr
bindkey '^j' peco-cdr

# PECO & ghq
function peco-src () {
    local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey '^g' peco-src
