require'nvim-treesitter.configs'.setup {
    ensure_installed = {"html", "tsx", "vue"},
    highlight = {
        enable = false, -- シンタックスハイライトを有効にする
    },
    autotag = {
        enable = true, -- nvim-ts-autotagの有効化
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    }
}
