vim.defer_fn(function ()
  vim.cmd [[ doautocmd User InitDeferredHigh ]]
end, 100)

vim.defer_fn(function ()
  vim.cmd [[ doautocmd User InitDeferredMedium ]]
end, 200)

vim.defer_fn(function ()
  vim.cmd [[ doautocmd User InitDeferredLow ]]
end, 400)

vim.defer_fn(function ()
  vim.cmd [[ doautocmd User InitUI ]]
end, 20)
