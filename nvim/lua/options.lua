vim.cmd([[
  language en_US.UTF-8
  scriptencoding utf-8
  set ambiwidth=double
  set nobomb
]])

vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.fileencodings = { 'utf-8', 'ucs-boms', 'euc-jp', 'ep932' }
vim.opt.fileformats = { 'unix', 'dos', 'mac' }

-- -----------------------------------------------------------
--          Vim Options
-- -----------------------------------------------------------
vim.opt.number = true                -- 行番号を表示
vim.opt.title = true                 -- ターミナルタイトルにファイル名を表示
vim.opt.showmatch = true             -- 対応する括弧を一瞬ハイライト
vim.opt.smartindent = true           -- オートインデント
vim.opt.ignorecase = true            -- 大文字小文字を区別しない検索
vim.opt.smartcase = true             -- 検索文字列に大文字が含まれてる場合のみ大文字小文字を区別
vim.opt.wrapscan = true              -- 最後まで検索したら先頭に戻る
vim.opt.hlsearch = true              -- 検索結果をハイライト
vim.opt.updatetime = 1000
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.clipboard = 'unnamed'        -- yankした文字列をクリップボードへ
vim.opt.completeopt = { 'menuone' }
vim.opt.splitbelow = true
vim.cmd('set cinoptions+=+1')        -- cinoptions+=+1
vim.opt.autoread = true             -- 外部でファイルが変更されたら自動で読み込み
vim.opt.showcmd = true
vim.opt.cursorline = true
vim.opt.virtualedit = 'onemore'
vim.opt.laststatus = 2
vim.opt.wildmode = { 'list:longest' }
vim.opt.showmode = false             -- モード表示を隠す (ステータスラインで表示するため)
vim.opt.relativenumber = false
vim.opt.belloff = 'all'              -- ビープ音を消す

-- filetype plugin indent on
vim.cmd('filetype plugin indent on')

--------------------------------------------------------------------------------
-- 全角スペースのハイライト (.vimrc の autocmd + function の置き換え)
--------------------------------------------------------------------------------
local function zenkakuSpace()
  vim.cmd('highlight ZenkakuSpace cterm=reverse ctermfg=red gui=reverse guifg=red')
end

if vim.fn.has('syntax') == 1 then
  local group = vim.api.nvim_create_augroup('ZenkakuSpace', { clear = true })

  -- カラースキーム変更時に呼び出し
  vim.api.nvim_create_autocmd('ColorScheme', {
    group = group,
    callback = function()
      zenkakuSpace()
    end,
  })

  -- VimEnter/WinEnter時にマッチを再設定
  vim.api.nvim_create_autocmd({ 'VimEnter', 'WinEnter' }, {
    group = group,
    callback = function()
      vim.cmd("match ZenkakuSpace /　/")
    end,
  })

  -- 起動時にも一度適用
  zenkakuSpace()
  vim.cmd("match ZenkakuSpace /　/")
end
