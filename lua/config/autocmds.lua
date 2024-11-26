-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local lint = require("lint")

vim.g.lint = false

vim.api.nvim_create_user_command("LintToggle", function()
  vim.g.lint = not vim.g.lint
  if vim.g.lint then
    lint.try_lint()
  else
    vim.diagnostic.reset(nil, 0)
    -- TODO: redraw the lsp output. Right now, it can be redrawn manually
    -- by entering/exiting insert mode.
  end
end, { desc = "Toggle Linter" })

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   callback = function()
--     if vim.g.lint then
--       lint.try_lint()
--     end
--   end,
-- })
