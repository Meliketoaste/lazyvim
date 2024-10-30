return {
  -- {
  --   'folke/tokyonight.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     --vim.cmd.colorscheme "tokyonight-night"
  --   end,
  --   opts = {},
  -- },
  {
    'rebelot/kanagawa.nvim',
    config = function()
      require('kanagawa').setup {

        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = 'none',
              },
            },
          },
        },
        overrides = function(colors)
          local theme = colors.theme
          return {

            -- Assign a static color to strings
            --String = { fg = colors.palette.carpYellow, italic = true },
            ---- theme colors will update dynamically when you change theme!
            --SomePluginHl = { fg = colors.theme.syn.type, bold = true },

            ['@markup.heading.1.markdown'] = { fg = colors.palette.dragonPink },
            ['@markup.heading.2.markdown'] = { fg = colors.palette.lightBlue },
            ['@markup.heading.3.markdown'] = { fg = colors.palette.springGreen },
            ['@markup.heading.4.markdown'] = { fg = colors.palette.dragonOrange2 },
            --Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = vim.o.pumblend },
            --PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
            --PmenuSbar = { bg = theme.ui.bg_m1 },
            --PmenuThumb = { bg = theme.ui.bg_p2 },
          }
        end,
      }

      -- Change color of headings
      vim.cmd.colorscheme 'kanagawa-dragon'
    end,
  },
}
