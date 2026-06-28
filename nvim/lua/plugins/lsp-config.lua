return {
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      auto_install = true,
      ensure_installed = { "lua_ls", "ts_ls", "html", "ruby_lsp" },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig", -- probably don't need this since installed below
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities() -- not working?
      -- Lowers lsp semantic_tokens priority so it doesn't override treesitter
      -- vim.highlight.priorities.semantic_tokens = 95
      
      -- These have default configutation since they're not being configured
      vim.lsp.config('lua_ls', { capabilities = capabilities })
      vim.lsp.config('ts_ls', { capabilities = capabilities })
      vim.lsp.config('html', { capabilities = capabilities })
      vim.lsp.config('ruby_lsp', { capabilities = capabilities })

      vim.lsp.enable({ 'lua_ls', 'ts_ls', 'html', 'ruby_lsp' })

      -- OLD WAY OF DOING THINGS COMMENTED BELOW:
      -- local lspconfig = require("lspconfig")
      -- lspconfig.lua_ls.setup({
      --   capabilities = capabilities
      -- })
      -- lspconfig.ts_ls.setup({
      --   capabilities = capabilities
      -- })
      -- lspconfig.html.setup({
      --   capabilities = capabilities
      -- })

      vim.keymap.set("n", "<C-Space>", vim.lsp.buf.hover, { desc = "LSP hover" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set({ "n", "v" }, "<leader>re", vim.lsp.buf.rename, { desc = "rename a word globally" })
    end,
  }
}
