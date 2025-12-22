alias sudo='sudo '

alias vi='nvim'
alias vim='nvim'

# クリップボードコピー関数 (文字化け対策版)
function clip() {
    # 標準入力から受け取った内容を nkf で UTF-8 から Shift_JIS に変換して clip.exe に渡す
    # (環境によって -w16L [UTF-16LE] が良い場合もありますが、まずは -s [Sjis] が安定します)
    nkf -s | clip.exe
}

