local M = {}

local keymap = vim.api.nvim_set_keymap
local bufmap = vim.api.nvim_buf_set_keymap

local opts = { noremap = true, silent = true }

function M.map(mode, key, map, inopts)
  inopts = inopts or opts
  keymap(mode, key, map, opts)
end

function M.bufmap(buf, mode, key, map, inopts)
  inopts = inopts or opts
  bufmap(buf, mode, key, map, inopts)
end


return M


