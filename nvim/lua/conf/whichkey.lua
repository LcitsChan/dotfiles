local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = false, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible

  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    -- n = { "g", "t" },
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local vopts = {
  mode = "v", -- VISUAL mode
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  g = {
    ["'"] = "which_key_ignore",
    ["`"] = "which_key_ignore",
  },
  ["<Leader>"] = {
    w = {
      name = "* Workbench",
      w = { "<cmd>MaximizerToggle!<cr>", "Maximize" },
      h = { "<cmd>set nosplitright<cr><cmd>vnew<cr><cmd>set splitright<cr>", "New left window" },
      l = { "<cmd>set splitright<cr><cmd>vnew<cr>", "New right window" },
      k = { "<cmd>set nosplitbelow<cr><cmd>new<cr><cmd>set splitbelow<cr>", "New below window" },
      j = { "<cmd>set splitbelow<cr><cmd>new<cr>", "New above window" },
      d = { "<cmd>Twilight<cr>", "Dim line" },
      z = { "<cmd>ZenMode<cr>", "Zen Mode" },
    },
    a = {
      name = "Goto",
      f = { "<cmd>Telescope file_browser<cr>", "Files" },
      r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document symbols" },
      o = { "<cmd>Telescope oldfiles<cr>", "Old files" },
      p = { "<cmd>Telescope projects<cr>", "Project" },
    },
    b = {
      name = "Buffer",
      o = { '<cmd>%bd|e#<cr>', "Close others" }
    },
    ["c"] = { "<cmd>Sayonara<cr>", "Sayonara" },
    d = {
      name = "Debug",
    },
    ["e"] = { "<cmd>Telescope buffers<cr>", "Recent buffers" },
    f = {
      name = "Find",
    },
    g = {
      name = "Git",
      j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" }, -- TODO doesn't work with repeat.vim
      k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
      l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
      p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
      r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
      R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
      s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
      u = {
        "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
        "Undo Stage Hunk",
      },
      o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
      C = {
        "<cmd>Telescope git_bcommits<cr>",
        "Checkout commit(for current file)",
      },
      d = {
        "<cmd>Gitsigns diffthis HEAD<cr>",
        "Git Diff",
      },
    },
    h = {
      name = "Highlight",
    },
    i = {
      name = "Translate",
    },
    j = {
      name = "Down",
      d = { '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', "Diagnostic" },
      -- treesitter
      f = { '^Function' },
      F = { '$Function' },
      c = { '^Class' },
      C = { '$Class' },
    },
    k = {
      name = "Up",
      d = { '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', "Diagnostic" },
      -- treesitter
      f = { '^Function' },
      F = { '$Function' },
      c = { '^Class' },
      C = { '$Class' },
    },
    l = {
      name = "Lsp",
    },
    m = {
      name = "Menu",
    },
    n = {
      name = "Notify",
      c = { "Close" }
    },
    o = {
      name = "Search Online",
      g = { "<cmd>lua require('browse').input_search()<cr>", "Google" },
      w = { 'yiw:lua require("browse.input").search_text "<C-r>""<cr>', "Google word" }
    },
    ["p"] = { "<cmd>Telescope commands<cr>", "Actions" },
    ["q"] = { "Quit" },
    ["Q"] = { "Force Quit" },
    ["z"] = { "Save" },
    r = {
      name = "Refactor",
      n = { "Rename" },
      c = { "Format" }
    },
    s = {
      name = "Search",
      g = { "<cmd>Telescope live_grep<cr>", "Text" },
      r = { "<cmd>Telescope reloader<cr>", "Reloader" },
    },
    t = {
      name = "Toggle",
      t = { "<cmd>Telescope<cr>", "Telescope" },
      w = { "<cmd>lua require('util').toggle_wrap()<cr>", "Wrap" }
    },
    v = {
      name = "View",
      e = { "<cmd>TroubleToggle<cr>", "Error" },
      o = { "<cmd>SymbolsOutline<cr>", "Outline" },
    },
    ["/"] = { "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", "Comment" },
    ["<cr>"] = { "<cmd>nohl<cr>", "Cancel highlight" },
    P = {
      name = "Packer",
      C = { "<cmd>PackerCompile<cr>", "Compile" },
      S = { "<cmd>PackerSync<cr>", "Sync" },
      I = { "<cmd>PackerStatus<cr>", "Info" },
      P = { "<cmd>PackerProfile<cr>", "Profile" },
      U = { "<cmd>UrlView packer<cr>", "Urls" }
    }
  }
}

local vmappings = {
  ["/"] = { "<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<cr>", "Comment" },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
