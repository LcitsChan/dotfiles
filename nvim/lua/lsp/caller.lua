local M = {}

function M.definitions()
  vim.lsp.buf.declaration()
 -- require("telescope.builtin").lsp_definitions()
end

function M.definition()
  vim.lsp.buf.definition()
end

function M.implementations()
  vim.lsp.buf.implementation()
  -- require("telescope.builtin").lsp_implementations()
end

function M.type_definitions()
  require("telescope.builtin").lsp_type_definitions()
end

function M.references()
  vim.lsp.buf.references()
  -- require("telescope.builtin").lsp_references()
end

function M.hover()
  vim.lsp.buf.hover()
end

function M.rename()
  vim.lsp.buf.rename()
end

function M.code_action()
  vim.lsp.buf.code_action()
end

function M.diagnotics_prev()
  vim.diagnostic.goto_prev({ border = "rounded" })
end

function M.diagnotics_next()
  vim.diagnostic.goto_next({ border = "rounded" })
end

function M.signature_help()
  vim.lsp.buf.signature_help()
end

function M.format()
  vim.lsp.buf.formatting()
end

return M
