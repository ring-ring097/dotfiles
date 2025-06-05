-- avante.nvim + 依存プラグイン
return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      provider = "copilot",
      auto_suggestions_provider = "copilot",
    },
    -- 動作設定
    behaviour = {
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = true,
      minimize_diff = true,
    },
    -- ウィンドウ設定
    windows = {
      position = "right",  -- サイドバーの位置
      wrap = true,        -- テキストの折り返し
      -- width = 30,         -- サイドバーの幅
      -- その他の詳細設定は省略
    },
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      { "echasnovski/mini.pick", optional = true },
      { "nvim-telescope/telescope.nvim", optional = true },
      { "hrsh7th/nvim-cmp", optional = true },
      { "ibhagwan/fzf-lua", optional = true },
      { "nvim-tree/nvim-web-devicons", optional = true },
      { "zbirenbaum/copilot.lua", optional = true },
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true,
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
