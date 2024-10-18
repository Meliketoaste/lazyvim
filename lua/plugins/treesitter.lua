return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    incremental_selection = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj
        keymaps = {
          --["aa"] = "@parameter.outer", -- outer argument
          --["ia"] = "@parameter.inner", -- inner argument
          -- Custom mapping for next inner parameter
          --["M"] = { query = "@parameter.inner", query_group = "locals", desc = "Next inner parameter" },
        },
      },
    }
  }

}
