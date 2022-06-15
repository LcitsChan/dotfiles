local status_ok, dressing = pcall(require, "dressing")
if not status_ok then
	return
end

dressing.setup({
  select = {
  get_config = function(opts)
    if opts.kind == 'codeaction' then
      return {
        telescope = require('telescope.themes').get_cursor({ initial_mode = "normal" })
      }
    end
  end
  }
})

