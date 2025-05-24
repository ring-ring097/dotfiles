-- Highlight todo, notes, etc in comments
return {
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      -- signs を有効にして、アイコンをすべてASCIIなどに置き換える
      signs = true,
      keywords = {
        FIX = {
          icon = 'F', -- "BUG" をやめて1文字に
          color = 'error',
          alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' },
        },
        TODO = {
          icon = 'T',
          color = 'info',
        },
        HACK = {
          icon = 'H',
          color = 'warning',
        },
        WARN = {
          icon = '!', -- OK
          color = 'warning',
          alt = { 'WARNING', 'XXX' },
        },
        PERF = {
          icon = 'P',
          alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' },
          color = 'default',
        },
        NOTE = {
          icon = 'N',
          color = 'hint',
          alt = { 'INFO' },
        },
      },
    },
  },
}
