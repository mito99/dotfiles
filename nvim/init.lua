-- ==============================
-- Neovim init.lua Configuration
-- ==============================

-- 1. 基本設定 (Options)
-- ----------------------------------------------------
local opt = vim.opt

opt.number = true             -- 行番号を表示
opt.relativenumber = true     -- 相対行番号を表示
opt.expandtab = true          -- タブをスペースに変換
opt.tabstop = 4               -- タブ幅を4スペースに設定
opt.shiftwidth = 4            -- シフト幅を4スペースに設定
opt.wrap = false              -- 折り返しを無効化
opt.termguicolors = true      -- ターミナルで真のカラー（24bit色）を有効化
opt.ignorecase = true         -- 検索時に大文字小文字を区別しない
opt.smartcase = true          -- 検索文字列に大文字が含まれる場合のみ大文字小文字を区別する
opt.hlsearch = true           -- 検索結果をハイライト
opt.incsearch = true          -- インクリメンタルサーチ（入力中にハイライト）
opt.updatetime = 300          -- スワップファイル書き込みなどの間隔（LSPに影響）
opt.timeoutlen = 500          -- キーコードのタイムアウト時間
opt.mouse = "a"               -- マウスを有効にする（全モード）
opt.undofile = true           -- アンドゥ履歴をファイルに保存
opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir" -- アンドゥファイル保存先
opt.scrolloff = 8             -- カーソルが画面の端から8行以内に来たらスクロール
opt.sidescrolloff = 8         -- 左右スクロールのオフセット

-- 2. クリップボード設定 (win32yank.exe 連携)
-- ----------------------------------------------------
opt.clipboard = "unnamedplus" -- システムクリップボードと同期（+ レジスタ）

vim.g.clipboard = {
  name = "win32yank-wsl",
  copy = {
    ["+"] = "win32yank.exe -i --crlf", -- Windows側へコピー時、改行をCRLFに変換
    ["*"] = "win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",   -- Windows側からペースト時、改行をLFに変換
    ["*"] = "win32yank.exe -o --lf",
  },
  cache_enabled = 0, -- キャッシュ無効化（WSL環境では無効が安定しやすい）
}

-- 3. ファイルエンコーディング設定
-- ----------------------------------------------------
opt.encoding = "utf-8"
opt.fileencodings = "utf-8,sjis,euc-jp,iso-2022-jp,latin1" -- 読み込み時の自動判別順

-- 4. その他のカスタマイズ
-- ----------------------------------------------------
-- Neovimの組み込みLSPの設定は、別途プラグイン（例: nvim-lspconfig）で管理するのが一般的です。
-- ここでは最低限の設定例のみ。

-- NvimTreeなどのプラグインで生成されるファイルを隠す
opt.wildignore = "*.o,*.obj,*~,.git,*.rbc,*.pyc,__pycache__,*.DS_Store,*.class"

-- テーマ設定の例 (別途プラグインでテーマをインストールする必要があります)
-- vim.cmd [[colorscheme pablo]]

-- 初期メッセージを非表示
opt.shortmess:append "c"

-- 5. プラグインマネージャー（Lazy.nvim を推奨）
-- ----------------------------------------------------
-- プラグインマネージャーは、通常 init.lua の冒頭で読み込むように設定しますが、
-- これを設定するとこの init.lua だけで完結するようになります。
--
-- ここではコメントアウトしていますが、もしプラグインを導入する場合は
-- Lazy.nvim ( https://github.com/folke/lazy.nvim ) のインストールスクリプトを
-- init.lua の冒頭に記述し、そこからプラグイン設定を読み込むようにします。
--
-- 例:
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not vim.loop.fs_stat(lazypath) then
--   vim.fn.system({
--     "git",
--     "clone", "--filter=blob:none",
--     "https://github.com/folke/lazy.nvim.git",
--     "--branch=stable", lazypath
--   })
-- end
-- vim.opt.rtp:prepend(lazypath)
--
-- require("lazy").setup({
--   -- ここにプラグイン設定を記述
--   -- { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
--   -- { 'neovim/nvim-lspconfig' },
-- })

-- ==============================
-- End of init.lua Configuration
-- ==============================
