local M = {}

function M.toggle_wrap()
  vim.opt.wrap = not vim.opt.wrap:get()
end

function M.toggle_number()
  vim.opt.number = not vim.opt.number:get()
end

return M
