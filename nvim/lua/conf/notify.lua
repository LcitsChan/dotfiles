local exists, notify = pcall(require, "notify")
if exists then
  vim.notify = notify
end

-- table from lsp severity to vim severity.
local severity = {
  "error",
  "warn",
  "info",
  "info", -- map both hint and info to info?
}

vim.lsp.handlers["window/showMessage"] = function(_, method, params, client_id)
  vim.notify(
    method.message,
    severity[params.type],
    { title = vim.lsp.get_client_by_id(client_id).name }
  )
end

vim.lsp.handlers["textDocument/definition"] = function(err, result, ctx, _)
  local client_encoding = vim.lsp.get_client_by_id(ctx.client_id).offset_encoding
  if err then
    vim.notify(err.message)
    return
  end
  if result == nil then
    vim.notify("Location not found", severity[ctx.type], {
      title = vim.lsp.get_client_by_id(ctx.client_id).name
    })
    return
  end
  if vim.tbl_islist(result) and result[1] then
    vim.lsp.util.jump_to_location(result[1], client_encoding)

    if #result > 1 then
      vim.fn.setqflist(vim.lsp.util.locations_to_items(result, client_encoding))
      vim.api.nvim_command("copen")
    end
  else
    vim.lsp.util.jump_to_location(result, client_encoding)
  end
end
