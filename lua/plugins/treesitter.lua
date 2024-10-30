return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre" },
    commit = "0d14299",
    opts = function(_, opts)
      opts.incremental_selection = {
        enable = true,
        keymaps = {
          node_incremental = "v",
          node_decremental = "V",
          scope_incremental = "<M-v>",
        },
      }
      opts.textobjects = {
        move = {
          enable = true,

          set_jumps = true,

        },
        --select = {
        --  enable = true,

        --  -- Automatically jump forward to textobj, similar to targets.vim
        --  lookahead = true,
        --  keymaps = {
        --    -- You can use the capture groups defined in textobjects.scm
        --    ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
        --    ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
        --    ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
        --    ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

        --    ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
        --    ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

        --    ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
        --    ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

        --    ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
        --    ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

        --    ["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
        --    ["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

        --    ["am"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
        --    ["im"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },

        --    ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
        --    ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
        --  },
        --},
        --select = {
        --  enable = true,
        --  lookahead = true,
        --  keymaps = {
        --    ["il"] = { query = "@loop.inner", desc = "Select inner loop" },
        --    ["al"] = { query = "@loop.outer", desc = "Select outer loop" },
        --
        --    ["a="] = { query = "@assignment.outer", desc = "Select outer assignment" },
        --    ["i="] = { query = "@assignment.inner", desc = "Select inner assignment" },
        --    ["l="] = { query = "@assignment.lhs", desc = "Select left handside assignment" },
        --    ["r="] = { query = "@assignment.rhs", desc = "Select right handside assignment" },
        --  },
        --},

        move = {
          enable = true,
          set_jumps = true,
          goto_next = {
            ["]c"] = "@conditional.inner",
          },
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
          goto_previous = {
            ["[c"] = "@conditional.inner",
          }
        },


        --move = {
        --  enable = true,
        --  set_jumps = true,
        --  goto_next_start = {
        --    ["]f"] = { query = "@function.outer", desc = "goto next function" },
        --    ["]c"] = { query = "@class.outer", desc = "goto next class" },
        --  },
        --  goto_next_end = {
        --    ["]F"] = { query = "@function.outer", desc = "goto next end of function" },
        --    ["]C"] = { query = "@class.outer", desc = "goto next end of class" },
        --  },
        --  goto_previous_start = {
        --    ["[f"] = { query = "@function.outer", desc = "goto previous function" },
        --    ["[c"] = { query = "@class.outer", desc = "goto previous class" },
        --  },
        --  goto_previous_end = {
        --    ["[F"] = { query = "@function.outer", desc = "goto previous end of function" },
        --    ["[C"] = { query = "@class.outer", desc = "goto previous end of class" },
        --  },
        --},
        swap = {
          enable = true,
          swap_next = {
            ["<leader>na"] = { query = "@parameter.inner", desc = "Swap parameter to next" },
            ["<leader>nf"] = { query = "@function.outer", desc = "Swap function to next" },
          },
          swap_previous = {
            ["<leader>pa"] = { query = "@parameter.inner", desc = "Swap parameter to previous" },
            ["<leader>pf"] = { query = "@function.outer", desc = "Swap function to previous" },
          },
        },
      }
      return vim.tbl_deep_extend("force", opts, {
        autotag = { enable = true },
      })
    end,
  },
  --{
  --  "mini.ai",
  --  enabled = true,
  --  opts = function()
  --    local ai = require("mini.ai")
  --    return {
  --      custom_textobjects = {
  --        c = ai.gen_spec.treesitter(
  --          { a = { "@class.outer", "@comment.outer" }, i = { "@class.inner", "@comment.inner" } },
  --          {}),
  --      },
  --    }
  --  end,
  --  config = function(_, opts)
  --    require("mini.ai").setup(opts)
  --  end,
  --},
  {
    "Wansmer/treesj",
    enabled = true,
    keys = {
      {
        "<leader>m",
        function()
          require("treesj").toggle()
        end,
        desc = "Split if one-line and join if multiline",
      },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "David-Kunz/treesitter-unit",
    -- stylua: ignore
    config = function()
      vim.api.nvim_set_keymap("x", "u", ':lua require"treesitter-unit".select()<CR>', { noremap = true })
      vim.api.nvim_set_keymap("o", "u", ':<c-u>lua require"treesitter-unit".select()<CR>', { noremap = true })
    end,
  },
}
