return {
  {
    "folke/persistence.nvim",
    opts = { options = vim.opt.sessionoptions:get() },
    -- stylua: ignore
    keys = {
      { "<leader>qs", false },
      { "<leader>ql", false },
      { "<leader>qd", false },
      { "<leader>S", "<leader>S", desc = "which_key_ignore" },
      { "<leader>Ss", function() require("persistence").load() end, desc = "Restore Session", },
      { "<leader>Sl", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session", },
      { "<leader>Sd", function() require("persistence").stop() end, desc = "Don't Save Current Session", },
    },
  },
}
