-- --------------------------------------------------------------
--          key mapping (レジスタ操作や補完など)
-- --------------------------------------------------------------

-- ビジュアル/ノーマルで 'x' を「黒穴レジスタ」へ
vim.keymap.set({ 'n', 'v' }, 'x', '"_x', { noremap = true })

-- 括弧の補完
-- vim.keymap.set('i', '{', '{}<Left>', { noremap = true })
--vim.keymap.set('i', '[', '[]<Left>', { noremap = true })
-- vim.keymap.set('i', '(', '()<Left>', { noremap = true })
-- vim.keymap.set('i', '`', '``<Left>', { noremap = true })

-- 関数括弧の補完 (改行を含む特殊マッピング)
-- vim.keymap.set('i', '{<CR>', '{}<Left><CR><ESC><S-o>', { noremap = true })
-- vim.keymap.set('i', '[<CR>', '[]<Left><CR><ESC><S-o>', { noremap = true })
-- vim.keymap.set('i', '(<CR>', '()<Left><CR><ESC><S-o>', { noremap = true })

-- クオートの補完
-- vim.keymap.set('i', "'", "''<Left>", { noremap = true })
-- vim.keymap.set('i', '"', '""<Left>', { noremap = true })

-- コロン(;)やカンマ(,)でノーマルモードへ
-- vim.keymap.set('i', ';;', '<ESC><S-a>;<ESC>', { noremap = true })
-- vim.keymap.set('i', ',,', '<ESC><S-a>,<ESC>', { noremap = true })

-- カーソル移動系
vim.keymap.set('n', 'j', 'gj', { noremap = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true })
vim.keymap.set('n', 'J', 'gjgjgj', { noremap = true })
vim.keymap.set('n', 'K', 'gkgkgk', { noremap = true })
vim.keymap.set('n', 'H', '0', { noremap = true })
vim.keymap.set('n', 'L', '$', { noremap = true })
vim.keymap.set('n', '<Left>', 'H', { noremap = true })
vim.keymap.set('n', '<Right>', 'L', { noremap = true })
vim.keymap.set('i', '<C-h>', '<Left>', { noremap = true })
vim.keymap.set('i', '<C-j>', '<Down>', { noremap = true })
vim.keymap.set('i', '<C-k>', '<Up>', { noremap = true })
vim.keymap.set('i', '<C-l>', '<Right>', { noremap = true })
vim.keymap.set('v', 'J', 'gjgjgj', { noremap = true })
vim.keymap.set('v', 'K', 'gkgkgk', { noremap = true })
vim.keymap.set('v', 'H', '0', { noremap = true })
vim.keymap.set('v', 'L', '$', { noremap = true })

-- ビジュアルモード
vim.keymap.set('n', 'vv', 'viw', { noremap = true })
-- "y/<C-r>" 相当 (選択範囲を yank してそのまま検索)
vim.keymap.set('v', '/', 'y/<C-r>"', { noremap = true })
vim.keymap.set('v', '>', '>gv', { noremap = true })
vim.keymap.set('v', '<', '<gv', { noremap = true })
vim.keymap.set('v', "'", "<Esc>`<i'<Esc>`><Right>a'<Esc>", { noremap = true })
vim.keymap.set('v', '"', "<Esc>`<i\"<Esc>`><Right>a\"<Esc>", { noremap = true })
vim.keymap.set('v', '(', "<Esc>`<i(<Esc>`><Right>a)<Esc>", { noremap = true })
vim.keymap.set('v', ')', "<Esc>`<i(<Esc>`><Right>a)<Esc>", { noremap = true })
vim.keymap.set('v', '{', "<Esc>`<i{<Esc>`><Right>a}<Esc>", { noremap = true })
vim.keymap.set('v', '}', "<Esc>`<i{<Esc>`><Right>a}<Esc>", { noremap = true })

-- 検索ハイライト解除
vim.keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR><Esc>', { noremap = true })

-- 画面分割系
vim.keymap.set('n', 'gr', 'gt', { noremap = true })
if vim.g.vscode then -- VSCode上でのNeovim設定
  vim.keymap.set('n', 'ee', "<Cmd>call VSCodeNotify('workbench.view.explorer')<CR>", { noremap = true })
else
  vim.keymap.set('n', 'ee', ':vs<CR>:e.<CR>', { noremap = true })
end

-- 画面移動
if vim.g.vscode then -- VSCode上でのNeovim設定
  vim.keymap.set('n', 't', "<Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>", { noremap = true })
  vim.keymap.set('n', 'T', '<C-w>h', { noremap = true })
else 
  vim.keymap.set('n', 't', '<C-w>w', { noremap = true })
  vim.keymap.set('n', 'T', '<C-`>', { noremap = true })
end

-- ヤンクボード系
vim.keymap.set('n', 'p', '"0p', { noremap = true })
vim.keymap.set('n', 'P', 'p', { noremap = true })

-- コマンドモード現在のパス表示
--  :cnoremap <expr> :: getcmdtype() == ':' ? expand('.') . '/' : '%%'
vim.keymap.set('c', '::', function()
  if vim.fn.getcmdtype() == ':' then
    return vim.fn.expand '.' .. '/'
  else
    return '%%'
  end
end, { expr = true, noremap = true })
