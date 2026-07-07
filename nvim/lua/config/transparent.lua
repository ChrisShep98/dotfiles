local M = {}

local function set_hl(group)
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group })

  if ok and hl then
    hl.bg = nil
    vim.api.nvim_set_hl(0, group, hl)
  else
    vim.api.nvim_set_hl(0, group, { bg = nil })
  end
end

local function clear(groups)
  for _, g in ipairs(groups) do
    set_hl(g)
  end
end

function M.enable()
  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
      -- core UI
      clear({
        "Normal",
        "NormalNC",
        "SignColumn",
        "EndOfBuffer",
        "LineNr",

        -- statusline / tabline
        "StatusLine",
        "StatusLineNC",
        "TabLine",
        "TabLineFill",
        "TabLineSel",

        -- floats
        "NormalFloat",
        "FloatBorder",

        -- popup / menus
        "Pmenu",
        "PmenuSel",
        "PmenuSbar",
        "PmenuThumb",
        "TelescopeBorder"
      })

      -- barbar
      clear({
        "BufferCurrent",
        "BufferCurrentIndex",
        "BufferCurrentMod",
        "BufferCurrentSign",
        "BufferCurrentTarget",

        "BufferVisible",
        "BufferVisibleIndex",
        "BufferVisibleMod",
        "BufferVisibleSign",
        "BufferVisibleTarget",

        "BufferInactive",
        "BufferInactiveIndex",
        "BufferInactiveMod",
        "BufferInactiveSign",
        "BufferInactiveTarget",

        "BufferTabpages",
        "BufferTabpage",
      })

      -- lazygit: make its floating window match Telescope's look.
      -- The plugin defines these with `default = true` on window open, so
      -- these non-default links win and are respected.
      -- I had to modify the config.yml file in 'Library/Application/ Support' to change color of the rest of the borders
      vim.api.nvim_set_hl(0, "LazyGitBorder", { link = "TelescopeBorder" })
    end,
  })

  -- run immediately for current colorscheme
  vim.cmd("doautocmd ColorScheme")
end

return M
