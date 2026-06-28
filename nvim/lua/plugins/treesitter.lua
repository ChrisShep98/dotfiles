return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      -- not sure if this is working correctly
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true, -- should auto install languages when you open different files
        ensure_installed = { "lua", "javascript", "typescript", "tsx", "html", "css" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
