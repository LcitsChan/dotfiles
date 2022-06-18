local core_plugins = {
  { "dstein64/vim-startuptime", cmd = {"StartupTime"} },
  { "wbthomason/packer.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "nvim-lua/popup.nvim" },

  { "kyazdani42/nvim-web-devicons" },
  { "kyazdani42/nvim-tree.lua" },

  -- Theme --
  -- Colorschemes
  { "trevordmiller/nova-vim" },
  { "rmehri01/onenord.nvim",
    config = function()
      require("onenord").setup()
    end
  },
  { "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup()
    end
  },
  { "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end
  },
  { "yamatsum/nvim-cursorline",
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
  { "rcarriga/nvim-notify" },
  -- Dashboard
  { "goolord/alpha-nvim", },

  -- Window --
  { "psliwka/vim-smoothie" },
  { "szw/vim-maximizer" },
  { "folke/twilight.nvim" },
  { "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {} end
  },


  -- Operation Enhance --
  { "tpope/vim-surround" },
  { "vim-scripts/ReplaceWithRegister" },
  { "tpope/vim-repeat" },
  { "tommcdo/vim-exchange" },
  { "ggandor/lightspeed.nvim" },


  -- Coding --
  -- Base
  { "lambdalisue/suda.vim" },
  { "farmergreg/vim-lastplace" },
  { "ahmedkhalf/project.nvim" },
  { "lewis6991/impatient.nvim" },
  { "lalitmee/browse.nvim" },
  -- Enhance
  -- Integrate with nvim-ts-context-commentstring
  { "numToStr/Comment.nvim" },
  { "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  },
  { "windwp/nvim-autopairs", },
  { "windwp/nvim-ts-autotag" },
  -- Reformat
  { "junegunn/vim-easy-align" },
  { "brooth/far.vim" },


  -- Treesitter --
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  { "nvim-treesitter/nvim-treesitter-context" },
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  { "nvim-treesitter/nvim-treesitter-refactor" },
  { "nvim-treesitter/playground" },
  { "nvim-treesitter/nvim-treesitter-textobjects" },

  -- CMP --
  { "hrsh7th/nvim-cmp" }, -- The completion plugin
  { "hrsh7th/cmp-buffer" }, -- buffer completions
  { "hrsh7th/cmp-path" }, -- path completions
  { "hrsh7th/cmp-cmdline" }, -- cmdline completions
  { "saadparwaiz1/cmp_luasnip" }, -- snippet completions
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lua" },
  -- Snippets
  { "L3MON4D3/LuaSnip" }, --snippet engine
  { "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use

  -- LSP --
  { "neovim/nvim-lspconfig" },
  { "williamboman/nvim-lsp-installer", },
  { "tamago324/nlsp-settings.nvim" }, -- language server settings defined in json for
  -- UI
  { "stevearc/dressing.nvim" },
  { "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
      }
    end
  },

  -- Telescope --
  { "nvim-telescope/telescope.nvim" },
  { "nvim-telescope/telescope-file-browser.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
  { "tami5/sqlite.lua" },
  { "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require "telescope".load_extension("frecency")
    end,
  },
  { "axieax/urlview.nvim" },

  -- Term --
  { "akinsho/toggleterm.nvim" },

  -- Keymap --
  { "folke/which-key.nvim" },

  -- Git --
  { "lewis6991/gitsigns.nvim" },
  { "tpope/vim-fugitive" },
  { "junegunn/gv.vim" },

  -- Tools --
  -- Symbol outline
  { "simrat39/symbols-outline.nvim" },
  { "mbbill/undotree" },


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
    threshold = 1, -- integer in milliseconds, plugins which load faster than this won't be shown in profile output
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
