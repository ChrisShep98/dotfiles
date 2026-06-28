return {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require('kanagawa').setup({
        commentStyle = { italic = false },
        keywordStyle = { italic = false},
        statementStyle = { bold = false },
        overrides = function(colors)
          local theme = colors
          return {
            -- Treesitter overrides
            ["@type.tsx"] = { fg = theme.fujiWhite },
            ["@type.builtin.tsx"] = { fg = "#7aa89f" },
            ["@type.builtin.typescript"] = { fg = "#7aa89f" },
            ["@type.typescript"] = { fb = theme.fujiWhite },
            ["@tag.builtin.tsx"] = { fg = "#E6C384" }, -- theme.carpYellow
            ["@tag.attribute"] = { fg = "#997ebc" },
            ["@tag.tsx"] = { fg = "#7aa89f" },
            ["@tag.html"] = { fg = "#E6C384" }, -- theme.carpYellow
            ["@constant.builtin.typescript"] = { fg = "#7aa89f" },
            ["@constant.builtin.tsx"] = { fg = "#7aa89f" },
            ["@constant.typescript"] = { fg = theme.fujiWhite },
            ["@constant.tsx"] = { fb = theme.fujiWhite },
            ["@constant.bash"] = { fb = theme.fujiWhite },
            ["@punctuation.special.tsx"] = { fg = "#9CABCA" },
            -- Semantic Token overrides
            ["@lsp.mod.readonly.typescriptreact"] = { fg = theme.fujiWhite },
            ["@lsp.mod.readonly.typescript"] = { fg = theme.fujiWhite },
            ["@lsp.typemod.variable.global.lua"] = { fg = theme.fujiWhite },
            ["@lsp.mod.readonly.javascript"] = { fg = theme.fujiWhite },
            ["@lsp.typemod.variable.defaultLibrary.typescript"] = { fg = theme.fujiWhite },
            ["@lsp.typemod.variable.defaultLibrary.typescriptreact"] = { fg = theme.waveRed },
            ["@lsp.typemod.variable.defaultLibrary.javascript"] = { fg = theme.waveRed },
            -- UI overrides
            NeoTreeFileName = { fg = "#ffffff" },      -- File names
            NeoTreeDirectoryName = { fg = "#ffffff" }, -- Directory names
            NeoTreeGitModified = { fg = "#E6C384" },
            LineNr = { bg = "#1F1F28" },
            SignColumn = { bg = "#1F1F28" }
          }
        end,
      })
      vim.cmd("colorscheme kanagawa-wave")
    end
  }
  -- {
  -- 	"projekt0n/github-nvim-theme",
  -- 	name = "github-theme",
  -- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
  -- 	priority = 1000, -- make sure to load this before all the other start plugins
  -- 	config = function()
  -- 		require("github-theme").setup({
  -- 			-- ...
  -- 			groups = {
  -- 				all = {
  -- 					["@string"] = { fg = "#ffd866" }, -- Treesitter string
  -- 					String = { fg = "#ffd866" }, -- fallback string
  -- 					NeoTreeGitModified = { fg = "#ffd866" }, -- Neo-tree git modified override
  -- 				},
  -- 			},
  -- 		})
  -- 		vim.cmd("colorscheme github_dark")
  -- 	end,
  -- },
}
