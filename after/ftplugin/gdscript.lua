local opt = vim.opt_local
local port = os.getenv 'GDScript_Port' or '6005'
--

-- Define a function to set up auto-indentation for GDScript files
local function setup_gdscript_indentation()
  vim.cmd 'autocmd FileType gdscript setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab'

  -- Define indentation rules specific to GDScript
  vim.cmd [[
        autocmd FileType gdscript setlocal cinoptions=:0,g0
        autocmd FileType gdscript setlocal cinwords=if,elif,else,for,while,class,func,match,switch,try,except,finally,block
    ]]
end

-- Call the function to set up auto-indentation for GDScript
setup_gdscript_indentation()

opt.autoindent = true
