local core_plugins = {

  {
    "wbthomason/packer.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
  },

  { "kyazdani42/nvim-web-devicons" },
  { "kyazdani42/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeClose" },
    config = function()
      require "conf.nvimtree"
    end,
  },

  -- Theme --
  -- Colorschemes
  { "trevordmiller/nova-vim", disable = true },
  { "rmehri01/onenord.nvim",
    event = "VimEnter",
    as = "theme",
    config = function()
      require("onenord").setup()
    end
  },
  { "nvim-lualine/lualine.nvim",
    module = "Mlualine",
    after = "theme",
    config = [[require('ui.lualine')]],
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  },

  { "norcalli/nvim-colorizer.lua",
    cmd = { 'ColorizerToggle' },
    config = function()
      require("colorizer").setup()
    end
  },
  { "yamatsum/nvim-cursorline",
    opt = true,
    event = "BufWinEnter",
    config = function()
      require("nvim-cursorline").setup {
        cursorline = {
          enable = true,
          timeout = 0,
          number = false,
        },
        cursorword = {
          enable = true,
          min_length = 3,
          hl = { underline = true },
        }
      }
    end
  },
  { "rcarriga/nvim-notify",
    after = "theme",
    config = function()
      require 'conf.notify'
    end
  },
  -- Dashboard
  { "goolord/alpha-nvim",
    config = function()
      require "conf.alpha"
    end
  },

  -- Window --
  { "psliwka/vim-smoothie", event = "GUIEnter" },
  { "szw/vim-maximizer", cmd = { "MaximizerToggle", "MaximizerToggle!" } },
  { "folke/twilight.nvim", cmd = { "Twilight" } },
  { "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require("zen-mode").setup({
        plugins = { gitsigns = true, tmux = true, kitty = { enabled = false, font = "+2" } },
      })
    end,
  },


  -- Operation Enhance --
  { "tpope/vim-surround", event = "VimEnter" },
  { "vim-scripts/ReplaceWithRegister", event = "VimEnter" },
  { "tpope/vim-repeat", event = "VimEnter" },
  { "tommcdo/vim-exchange", event = "VimEnter" },
  { "ggandor/lightspeed.nvim", event = "VimEnter" },


  -- Coding --
  -- Base
  { "lambdalisue/suda.vim" },
  { "farmergreg/vim-lastplace" },
  { "lewis6991/impatient.nvim" },
  { "lalitmee/browse.nvim" },

  -- Enhance
  -- Integrate with nvim-ts-context-commentstring
  { "numToStr/Comment.nvim",
    event = 'BufWinEnter',
    config = function()
      require "conf.comment"
    end
  },
  { "folke/todo-comments.nvim",
    event = 'BufWinEnter',
    config = function()
      require("todo-comments").setup {}
    end
  },
  { "windwp/nvim-ts-autotag" },

  -- Prettification
  { "junegunn/vim-easy-align",
    cmd = "EasyAlign",
  },
  { "brooth/far.vim",
    cmd = { "Far", "Farr", "Farp", "Farf" },
    config = function()
      require "conf.far"
    end
  },


  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    requires = {
      { "nvim-treesitter/nvim-treesitter-context" },
      { "JoosepAlviste/nvim-ts-context-commentstring" },
      { "nvim-treesitter/nvim-treesitter-refactor" },
      { "nvim-treesitter/playground" },
      { "nvim-treesitter/nvim-treesitter-textobjects" },
    },
    run = ":TSUpdate",
    config = [[ require"conf.treesitter" ]],
  },

  -- CMP
  { "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require "conf.cmp"
    end,
    module = "Mcmp",
    wants = { "LuaSnip", "friendly-snippets" },
    requires = {
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" }, -- buffer completions
      { "hrsh7th/cmp-path", after = "nvim-cmp" }, -- path completions
      { "hrsh7th/cmp-cmdline", after = "nvim-cmp" }, -- cmdline completions
      { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" }, -- snippet completions
      { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
      -- Snippets
      { "L3MON4D3/LuaSnip", opt = true, after = "nvim-cmp" }, --snippet engine
      { "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use
      { "windwp/nvim-autopairs",
        config = function()
          require "conf.autopairs"
        end,
        after = "nvim-cmp"
      },
    }
  },

  -- LSP --
  { "neovim/nvim-lspconfig",
    event = "VimEnter",
    config = function()
      require "lsp"
      vim.cmd("LspStart")
    end,
    module = "Mlsp",
    wants = "nvim-lsp-installer",
    requires = {
      { "williamboman/nvim-lsp-installer", opt = true },
    },
  },
  { "stevearc/dressing.nvim",
    event = "VimEnter",
    config = function()
      require "conf.dressing"
    end
  },
  { "folke/trouble.nvim",
    event = "BufWinEnter",
    requires = "kyazdani42/nvim-web-devicons",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require("trouble").setup({ auto_open = false })
    end,
  },


  -- Search
  {
    {
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        "telescope-frecency.nvim",
        "telescope-fzf-native.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-telescope/telescope-project.nvim",
        "nvim-telescope/telescope-symbols.nvim",
      },
      -- make sure plugins loaded and then apply config
      wants = {
        "popup.nvim",
        "plenary.nvim",
        "telescope-frecency.nvim",
        "telescope-fzf-native.nvim",
      },
      config = [[require('conf.telescope')]],
      cmd = "Telescope",
      module = "Mtelescope",
    },
    {
      "nvim-telescope/telescope-frecency.nvim",
      after = "telescope.nvim",
      requires = "tami5/sqlite.lua",
    },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make",
    },
    { "axieax/urlview.nvim",
      cmd = "UrlView",
      config = function()
        require("conf.urlview")
        require("telescope").load_extension("urlview")
      end,
      wants = "telescope.nvim",
    },
    {
      "ahmedkhalf/project.nvim",
      after = "telescope.nvim",
      config = function()
        require("conf.project")
        require('telescope').load_extension('projects')
      end
    },
  },

  -- Term --
  { "akinsho/toggleterm.nvim",
    event = 'BufWinEnter',
    config = function()
      require "conf.toggleterm"
    end
  },

  -- Keymap --
  { "folke/which-key.nvim",
    event = "VimEnter",
    -- keys = { '<leader>', '"', '`' },
    config = function()
      require "conf.whichkey"
    end,
  },

  -- Git --
  { "lewis6991/gitsigns.nvim",
    event = 'BufWinEnter',
    config = function()
      require "conf.gitsigns"
    end
  },
  { "tpope/vim-fugitive", cmd = { 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull' } },
  { "junegunn/gv.vim", cmd = { "GV", "GV!" } },

  -- Tools --
  -- Symbol outline
  { "simrat39/symbols-outline.nvim", cmd = "SymbolsOutline" },
  { "mbbill/undotree",
    event = 'BufWinEnter',
    config = function()
      require "conf.undotree"
    end
  },

  -- Profiling
  {
    {
      "tweekmonster/startuptime.vim", cmd = "StartupProfile", config = function()
        vim.cmd("command! -nargs=* -complete=file StartupProfile call startuptime#profile(<f-args>)")
      end
    },
    {
      "dstein64/vim-startuptime", cmd = "StartupAnalyer", config = function()
        vim.cmd("command -nargs=* -complete=custom,startuptime#CompleteOptions StartupAnalyer :call startuptime#StartupTime(<q-mods>, <f-args>)")
        vim.g.startuptime_tries = 10
      end
    }
  },

  -- Spectified syntax
  { "isobit/vim-caddyfile" }

}

for _, entry in ipairs(core_plugins) do
  entry["lock"] = true
end

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  -- snapshot = "sloth",
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  profile = {
    enable = true,
    threshold = 0, -- integer in milliseconds, plugins which load faster than this won't be shown in profile output
  },
}

-- Install your plugins here
return packer.startup(function(use)

  for _, plugin in ipairs(core_plugins) do
    use(plugin)
  end

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
