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
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
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
  local status_ok, wk = pcall(require, "which-key")
  if not status_ok then
    return
  end
  local wkopts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }
  local caller = require("lsp.caller")
  local leader_mappings = {
    j = {
      d = { caller.diagnotics_next, "Diagnostic" },
    },
    k = {
      d = { caller.diagnotics_prev, "Diagnostic" },
    },
    r = {
      n = { caller.rename, "Rename" },
      c = { caller.format, "Format" }
    }
  }
  wk.register(leader_mappings, wkopts)

  -- local mappings = {
  --   ["gd"] = { caller.definition, "" },
  --   ["gD"] = { caller.definitions, "" },
  --   ["gy"] = { caller.references, "" },
  --   -- ["gi"] = { caller.implementations, "" },
  --   ["gi"] = { '<cmd>lua require("lsp.caller").definition()<cr>', "" },
  --   ["gt"] = { caller.type_definitions, "" },
  --   ["K"] = { caller.hover, "" },
  --   ["<C-k>"] = { caller.signature_help, "" },
  --   ["ta"] = { caller.code_action, "" },
  -- }
  -- wk.register(mappings, opts)
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

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
