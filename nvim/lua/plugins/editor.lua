return {
  {
    "folke/which-key.nvim",
    event = "LazyFile",
    opts = {
      icons = {
        rules = false,
      },
      spec = {
        { "<leader><tab>", hidden = true },
        { "<leader>sn", hidden = true },
        { "<leader>n", group = "+noice" },
      },
    },
  },
  {
    "telescope.nvim",
    lazy = true,
    cmd = "Telescope",
    opts = function()
      local actions = require("telescope.actions")
      local action_layout = require("telescope.actions.layout")
      return {
        defaults = {
          layout_config = {
            horizontal = {
              preview_cutoff = 40,
              preview_width = 0.5,
            },
          },
          prompt_prefix = "  ",
          mappings = {
            i = {
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-h>"] = action_layout.toggle_preview,
              ["<Down>"] = actions.move_selection_next,
              ["<Up>"] = actions.move_selection_previous,
              ["<C-c>"] = { "<C-u>", type = "command" },
              ["<C-o>"] = { "<esc>", type = "command" },
              ["<esc>"] = actions.close,
            },

            n = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-h>"] = action_layout.toggle_preview,
              ["<esc>"] = actions.close,
              ["<CR>"] = actions.select_default,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              ["<C-t>"] = actions.select_tab,
              ["K"] = actions.preview_scrolling_up,
              ["J"] = actions.preview_scrolling_down,
              ["H"] = actions.preview_scrolling_left,
              ["L"] = actions.preview_scrolling_right,
              ["o"] = actions.select_default,
              ["q"] = actions.close,
            },
          },
        },
      }
    end,
    keys = {
      { "<leader>/", mode = { "n", "v" }, false },
      { "<leader>G", mode = { "n" }, '<cmd>lua LazyVim.pick("live_grep")()<cr>', desc = "Grep Files", },
      { "<leader><space>", LazyVim.pick("auto"), desc = "which_key_ignore" },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "which_key_ignore" },
    },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    lazy = true,
    -- cmd = "Telescope",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      local actions = require("telescope.actions")
      local fb_actions = require("telescope._extensions.file_browser.actions")
      require("telescope").setup({
        extensions = {
          file_browser = {
            path = "%:p:h",
            theme = "dropdown",
            preview_cutoff = 40,
            hijack_netrw = true,
            select_buffer = true,
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            initial_mode = "normal",
            mappings = {
              ["i"] = {
                ["<C-bs>"] = fb_actions.backspace,
              },
              ["n"] = {
                ["h"] = fb_actions.goto_parent_dir,
                ["l"] = actions.select_default,
                ["."] = fb_actions.toggle_hidden,
                ["I"] = function()
                  local telescope = require("telescope")
                  telescope.extensions.file_browser.file_browser(require("telescope.themes").get_ivy({}))
                end,
              },
            },
          },
        },
      })
      require("telescope").load_extension("file_browser")
    end,
    keys = {
      {
        "<leader>i",
        mode = { "n", "v" },
        function()
          local telescope = require("telescope")
          telescope.extensions.file_browser.file_browser({
            previewer = false,
            layout_config = { height = 30 },
          })
        end,
        desc = "which_key_ignore",
      },
    },
  },
  {
    "ahmedkhalf/project.nvim",
    lazy = true,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("project_nvim").setup({
        require("telescope").load_extension("projects"),
      })
    end,
    keys = {
      { "<leader>sp", "<cmd>Telescope projects<cr>", mode = "n", desc = "Projects" },
    },
  },
  {
    "szw/vim-maximizer",
    keys = {
      { "<leader>wm", mode = { "n", "v" }, "<cmd>MaximizerToggle<cr>", desc = "Maximizer" },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    opts = {
      commands = {
        open_then_close = function(state, toggle_directory) -- define a global "hello world" function
          require("neo-tree.sources.common.commands").open(state, toggle_directory)
          vim.schedule(function()
            vim.cmd([[Neotree close]])
          end)
        end,
      },
      window = {
        mappings = {
          ["oc"] = "none",
          ["od"] = "none",
          ["og"] = "none",
          ["om"] = "none",
          ["on"] = "none",
          ["os"] = "none",
          ["ot"] = "none",
          ["<C-f>"] = "none",
          ["<C-b>"] = "none",
          [","] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "," } },
          [",c"] = { "order_by_created", nowait = false },
          [",d"] = { "order_by_diagnostics", nowait = false },
          [",g"] = { "order_by_git_status", nowait = false },
          [",m"] = { "order_by_modified", nowait = false },
          [",n"] = { "order_by_name", nowait = false },
          [",s"] = { "order_by_size", nowait = false },
          [",t"] = { "order_by_type", nowait = false },
          ["o"] = "open",
          ["O"] = "open_then_close",
          ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
          ["l"] = "open",
          ["h"] = "close_node",
          ["J"] = { "scroll_preview", config = { direction = -20 } },
          ["K"] = { "scroll_preview", config = { direction = 20 } },
          ["{"] = {
            function()
              vim.api.nvim_command("vertical resize -5")
            end,
            desc = "Decrease width",
          },
          ["}"] = {
            function()
              vim.api.nvim_command("vertical resize +5")
            end,
            desc = "Increase width",
          },
        },
      },
    },
    keys = {
      { "<leader>e", "<leader>fe", desc = "which_key_ignore", remap = true },
      { "<leader>E", "<leader>fE", desc = "which_key_ignore", remap = true },
    },
  },
  {
    "echasnovski/mini.files",
    opts = {
      windows = {
        preview = true,
        width_preview = 40,
      },
    },
    keys = {
      { "<leader>F", "<cmd>lua MiniFiles.open()<cr>", desc = "which_key_ignore" },
    },
  },
  {
    "sindrets/diffview.nvim",
    cmd = "DiffviewOpen",
  },
  {
    "Bekaboo/dropbar.nvim",
    event = "LazyFile",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        wezterm = {
          enabled = true,
          font = "+1",
        },
      },
    },
  },
  {
    "monaqa/dial.nvim",
    opts = function(_, opts)
      local augend = require("dial.augend")
      local capitalized_boolean = augend.constant.new({
        elements = {
          "True",
          "False",
        },
        word = true,
        cyclic = true,
      })
      table.insert(opts.groups.default, augend.constant.alias.bool)
      table.insert(opts.groups.default, capitalized_boolean)
    end,
      -- stylua: ignore
    keys = {
      { "<C-a>", false, mode = { "n", "v" } },
      { "<C-x>", false, mode = { "n", "v" } },
      { "+", "<Plug>(dial-increment)", desc = "Increment", mode = {"n", "v"} },
      { "-", "<Plug>(dial-decrement)", desc = "Decrement", mode = {"n", "v"} },
    },
  },
}
