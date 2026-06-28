return {
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua, -- formatter
          null_ls.builtins.formatting.prettier, -- formatter for js/ts
          null_ls.builtins.formatting.rubocop,
          --          null_ls.builtins.diagnostics.eslint_d -- linter for js/ts (not loading?)
        },
      })
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
  },
}
