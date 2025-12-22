# Env
export PATH=$HOME/bin:/usr/local/bin:$PATH


# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# mise
eval "$(mise activate zsh)"

# Homebrewの補完パスを追加
if type brew &>/dev/null; then
  # 補完関数の検索パスの先頭に追加
  fpath=($(brew --prefix)/share/zsh-completions $fpath)

  # 補完機能を有効化 (autoload -U compinit && compinit)
  # ※ 既に .zshrc 本体のどこかで compinit を呼んでいる場合は、
  # この fpath 設定をその「前」に書くことが重要です。
  autoload -U compinit
  compinit
fi
