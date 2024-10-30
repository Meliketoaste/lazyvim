return {
  "mg979/vim-visual-multi",
  event = "VeryLazy",

  init = function()
    vim.g.VM_maps = {
      ["Find Under"] = "<C-g>",
      ["Find Subword Under"] = "<C-g>",
      ["Select Cursor Down"] = "<C-n>",
      ["Select Cursor Up"] = "<C-p>",
    }
    -- vim.keymap.set("n", "<M-C-k>", "<Plug>(VM-Add-Cursor-Up)", { desc = "VM mode Cursor Up" })
    -- vim.keymap.set("n", "<M-C-j>", "<Plug>(VM-Add-Cursor-Down)", { desc = "VM mode Cursor Down" })
  end,

  keys = {
    { "<leader>M",  desc = "Multiple Cursors" },
    { "<leader>Mn", "<Plug>(VM-Find-Under)<CR>", desc = "Word under cursor" },
  },
}
