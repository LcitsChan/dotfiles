return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {},
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          node_decremental = false,
          scope_incremental = "<TAB>",
        },
      },
    },
    -- stylua: ignore
    keys = {
      { "<bs>", ":lua require('nvim-treesitter.incremental_selection').node_decremental()<cr>", desc = "Node decremental", mode = "x", silent = true, },
    },
  },
}
