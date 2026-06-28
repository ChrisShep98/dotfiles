return {
  "sindrets/diffview.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", { desc = "Git Diffview" })
    vim.keymap.set("n", "<leader>gD", ":DiffviewClose<CR>", { desc = "Close Diffview" })
    vim.keymap.set("n", "<leader>gh", ":DiffviewFileHistory<CR>", { desc = "File History" })
  end,
}
