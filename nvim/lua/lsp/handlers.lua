local M = {}

-- TODO: backfill this to template
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    config = true,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]] ,
      false
    )
  end
end

local function lsp_keymaps(bufnr)
  local bufmap = require("kmutil").bufmap
  local opts = {
    noremap = true,
    silent = true,
  }

  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", '<cmd>lua require("lsp.caller").definitions()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", '<cmd>lua require("lsp.caller").definition()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", '<cmd>lua require("lsp.caller").implementations()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gt", '<cmd>lua require("lsp.caller").type_definitions()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gy", '<cmd>lua require("lsp.caller").references()<cr>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", '<cmd>lua require("lsp.caller").hover()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-p>", '<cmd>lua require("lsp.caller").signature_help()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "i", "<C-p>", '<cmd>lua require("lsp.caller").signature_help()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "ta", '<cmd>lua require("lsp.caller").code_action()<CR>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>jd", '<cmd>lua require("lsp.caller").diagnotics_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>kd", '<cmd>lua require("lsp.caller").diagnotics_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", '<cmd>lua require("lsp.caller").rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rc", '<cmd>lua require("lsp.caller").format()<CR>', opts)

  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "gl",
    '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
    opts
  )
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
  end
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end


local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
end

return M
