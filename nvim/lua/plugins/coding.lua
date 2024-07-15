return {
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      mappings = {
        comment = "gc",
        comment_line = "<leader>/",
        comment_visual = "<leader>/",
        textobject = "gc",
      },
    },
  },
  {
    "nvim-cmp",
    lazy = true,
    opts = function(_, opts)
      local kind_icons = {
        Text = "",
        Method = "m",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
      }
      -- local luasnip = require("luasnip")
      -- local cmp = require("cmp")
      opts.formatting = {
        format = function(entry, vim_item)
          vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
          vim_item.menu = ({
            nvim_lsp = "L",
            luasnip = "S",
            buffer = "B",
            path = "P",
            nvim_lua = "N",
          })[entry.source.name]
          return vim_item
        end,
      }
      table.insert(opts.sources, 1, {
        name = "codeium",
        group_index = 1,
        priority = 100,
      })
    end,
    keys = {
      "i",
      {
        "<C-j>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<C-j>"
        end,
        expr = true,
        silent = true,
        mode = { "i", "s" },
      },
      {
        "<C-j>",
        function()
          local cmp = require("cmp")
          if cmp.visible() then
            return cmp.select_next_item()
          else
            return "<C-z>"
          end
        end,
        expr = true,
        silent = true,
        mode = "c",
      },
      {
        "<C-k>",
        function(fallback)
          local cmp = require("cmp")
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end,
        expr = true,
        silent = true,
        mode = "c",
      },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    keys = {
      { "i" },
    },
  },
  {
    "gbprod/yanky.nvim",
    keys = {
      {
        "<leader>p",
        function()
          if LazyVim.pick.picker.name == "telescope" then
            require("telescope").extensions.yank_history.yank_history({})
          else
            vim.cmd([[YankyRingHistory]])
          end
        end,
        desc = "which_key_ignore",
      },
    },
  },
}
