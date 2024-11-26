return {
  'habamax/vim-godot',
  ft = 'gdscript',
  keys = {
    { '<F4>', '<cmd>:GodotRunLast<cr>',    ft = 'gdscript' },
    { '<F5>', '<cmd>:GodotRun<cr>',        ft = 'gdscript' },
    { '<F6>', '<cmd>:GodotRunCurrent<cr>', ft = 'gdscript' },
    { '<F7>', '<cmd>:GodotRunFZF<cr>',     ft = 'gdscript' },
  },
  config = function()
    vim.g.godot_executable = "/usr/bin/env godot4"
  end
}
