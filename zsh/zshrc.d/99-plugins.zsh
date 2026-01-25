HB_PREFIX=$(brew --prefix)

# zsh-autosuggestions の読み込み
if [ -f "$HB_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source "$HB_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# zsh-syntax-highlighting の読み込み
# ※これは必ず最後に読み込む必要があります
if [ -f "$HB_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "$HB_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
