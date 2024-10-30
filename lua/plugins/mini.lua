return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    --keys = {
    --},
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --require("mini.indentscope").setup {

      --  symbol = "",

      --  mappings = {
      --    -- Textobjects
      --    object_scope = 'ii',
      --    object_scope_with_border = 'ai',

      --    -- Motions (jump to respective border line; if not present - body line)
      --    goto_top = '[i',
      --    goto_bottom = ']i',
      --  },
      --}
      require('mini.basics').setup {

        options = {
          extra_ui = true,
          win_borders = 'single',
        },
      }
      --require('mini.bufremove').setup()


      require('mini.move').setup()
      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
