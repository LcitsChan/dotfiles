return {
  {
    "catppuccin/nvim",
    opts = {
      transparent_background = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
    },
    keys = {
      { "<leader>nn", mode = { "n" }, "<cmd>Telescope notify<cr>", desc = "Notifications History" },
      { "<leader>nc", mode = { "n", "v" }, "<cmd>Telescope notify<cr>", desc = "Notifications History" },
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })
      opts.presets.lsp_doc_border = true
    end,
    -- stylua: ignore
    keys = {
      { "<leader>nl", function() require("noice").cmd("last") end, desc = "Noice Last Message", },
      { "<leader>nh", function() require("noice").cmd("history") end, desc = "Noice History", },
      { "<leader>na", function() require("noice").cmd("all") end, desc = "Noice All", },
      { "<leader>nd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All", },
      { "<leader>nt", function() require("noice").cmd("pick") end, desc = "Noice Picker (Telescope/FzfLua)", },
    },
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      function Mmodified()
        return {
          function()
            return "[+]"
          end,
          cond = function()
            return vim.bo.modified
          end,
        }
      end
      local icons = LazyVim.config.icons
      opts.options = {
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      }
      opts.sections.lualine_c = {
        LazyVim.lualine.root_dir({ icon = "" }),
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { LazyVim.lualine.pretty_path() },
      }
      opts.sections.lualine_z = {
        {
          function()
            return os.date("%R")
          end,
        },
      }
      table.insert(opts.sections.lualine_x, 2, LazyVim.lualine.cmp_source("codeium"))
    end,
  },
}
