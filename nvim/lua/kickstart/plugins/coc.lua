return {
  {
    'neoclide/coc.nvim',
    branch = 'release',
    build = function()
      vim.cmd '!yarn install --frozen-lockfile'
    end,
    config = function()
      -- 基本設定
      vim.o.hidden = true
      vim.o.backup = false
      vim.o.writebackup = false
      vim.o.pumblend = 10
      vim.o.updatetime = 100

      -- ステータスラインにCocステータスを表示
      vim.opt.statusline:prepend '%{coc#status()}'

      -- キー設定
      local opts = { noremap = true, silent = true }
      vim.api.nvim_set_keymap('n', '<Leader><Leader>', ':<C-u>CocList<CR>', opts)
      vim.api.nvim_set_keymap('n', '<Leader>h', ':<C-u>call CocAction("doHover")<CR>', opts)
      vim.api.nvim_set_keymap('n', '<Leader>df', ':vs<CR><Plug>(coc-definition)', opts)
      vim.api.nvim_set_keymap('n', '<Leader>rf', '<Plug>(coc-references)', opts)
      vim.api.nvim_set_keymap('n', '<Leader>rn', '<Plug>(coc-rename)', opts)
      vim.api.nvim_set_keymap('n', '<Leader>fmt', '<Plug>(coc-format)', opts)
      vim.api.nvim_set_keymap('n', '<Leader>e', ':CocCommand explorer<CR>', opts)
      vim.api.nvim_set_keymap('n', '<C-p>', '<Plug>(coc-diagnostic-prev)', opts)
      vim.api.nvim_set_keymap('n', '<C-n>', '<Plug>(coc-diagnostic-next)', opts)

      -- コマンド設定
      vim.cmd 'command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument'
      vim.cmd 'command! -nargs=0 Swagger :CocCommand Swagger.render'
    end,
  },
}
