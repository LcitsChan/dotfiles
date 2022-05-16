vim.opt.timeoutlen     = 300                                               -- Time in milliseconds to wait for a mapped sequence to complete
vim.opt.scrolloff      = 100                                                -- Keep cursor always in the center screen
vim.opt.autoread       = true              --  Automatically read changed files
vim.opt.autowrite      = true              --  Automatically save before :next, :make etc.
vim.opt.encoding       = "utf-8"             --  Set default encoding to UTF-8
vim.opt.fileformats    = { "unix","dos","mac" }      --  Prefer Unix over Windows over OS 9 formats
vim.opt.expandtab      = true              --  Use the appropriate number of spaces to insert a <Tab>
vim.opt.autoindent     = true              --  Copy indent from current line when starting a new line
vim.opt.tabstop        = 2                 --  Number of spaces that a <Tab> in the file counts for.
vim.opt.smarttab       = true              --  Insert blanks in front of a line according to 'shiftwidth'
vim.opt.shiftwidth     = 2                 --  Number of spaces to use for each step of (auto)indent.
vim.opt.softtabstop    = 2                 --  Number of spaces that a <Tab> counts for while performing editing operations
vim.opt.backspace      = { "indent","eol","start" }  --  Makes backspace key more powerful.
vim.opt.number         = true              --  Show line numbers
vim.opt.relativenumber = true              --  Show the line number relative to cursorline
vim.opt.showcmd        = true              --  Show me what I'm typing
vim.opt.cmdheight      = 1                 --  Display more cmd's info
vim.opt.wrap           = true
vim.opt.wildmenu       = true              --  command-line completion operates in an enhanced mode.
vim.opt.completeopt    = { "menu","menuone" }      --  Show popup menu, even if there is one entry
vim.opt.pumheight      = 10                --  Completion window max size
vim.opt.laststatus     = 2                 --  Show status line always
vim.opt.ignorecase     = true              -- =true Search case insensitive...
vim.opt.smartcase      = true              --  ... but not it begins with upper case
vim.opt.incsearch      = true              --  Shows the match while typing
vim.opt.hlsearch       = true              --  Highlight found searches
vim.opt.showmatch      = false             --  Do not show matching brackets by flickerin
vim.opt.showmode       = false             --  We show the mode with airline or lightline
vim.opt.errorbells     = false             --  No beeps
vim.opt.visualbell     = true              --  Use visual bell instead of beeping
vim.opt.hidden         = true              --  Buffer should still exist if window is closed
vim.opt.swapfile       = false             --  Don't use swapfile
vim.opt.backup         = false             --  Don't create annoying backup files
vim.opt.writebackup    = false             --  Do not make a backup before overwriting a file
vim.opt.history        = 700               --  The command-lines that you enter are remembered in a history table.
vim.opt.splitright     = true              --  Vertical windows should be split to right
vim.opt.splitbelow     = true              --  Horizontal windows should split to bottom
vim.opt.signcolumn     = "yes"             -- always show the sign column, otherwise it would shift the text each time
vim.opt.nrformats      = { "bin", "hex", "alpha"  }
vim.opt.whichwrap      = "b,s,<,>"
vim.opt.termguicolors  = true

-- vim.cmd "colorscheme nova"
-- vim.cmd "highlight! link SignColumn Normal"
vim.cmd "au TextYankPost * silent! lua vim.highlight.on_yank { timeout=300 }"
