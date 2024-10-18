-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }


-- Reset keymaps
--vim.keymap.del({ 'n', 'v' }, 'S')

---- Edit LazyVim config
--keymap("n", "<leader>se", ":e $MYVIMRC<RETURN>", { silent = true, desc = "configuration" })
--
---- Show messages & errors history
--keymap("n", "<leader>sm", ":Telescope notify", { silent = true, desc = "Messages history" })
--
---- references
--keymap("n", "<leader>j", "<Cmd>Trouble lsp toggle<CR>", { silent = true, desc = "LSP definitions, references, ..." })
vim.g.cmptoggle = false

local cmp = require("cmp")
cmp.setup({
  enabled = function()
    return vim.g.cmptoggle
  end,
})
vim.keymap.set("n", "<leader>ua", "<cmd>lua vim.g.cmptoggle = not vim.g.cmptoggle<CR>", { desc = "toggle nvim-cmp" })
