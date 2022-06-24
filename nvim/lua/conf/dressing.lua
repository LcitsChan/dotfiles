local status_ok, dressing = pcall(require, "dressing")
if not status_ok then
  return
end

dressing.setup({
  select = {
    get_config = function(opts)
      if opts.kind == 'codeaction' then
        local loaded, themes = pcall(require, 'telescope.themes')
        if not loaded then
          vim.cmd [[ PackerLoad telescope.nvim ]]
          themes = require('telescope.themes')
        end
        return {
          telescope = themes.get_cursor({ initial_mode = "normal" })
        }
      end
    end
  }
})
