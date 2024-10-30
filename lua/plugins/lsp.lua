local function lspcmd(params)
  return function()
    vim.cmd.RustLsp(params)
  end
end
-- check whether we are within a git repo
-- search for the `.git` repo in the current working directory, from the current directory
-- up to through parent directories
function in_git()
  local git_dir = vim.fn.finddir(".git", ".;")
  if git_dir ~= "" then
    return true
  end
end

-- small utility function to make defining keymaps easier
function nmap(mode, keys, func, additional_args)
  additional_args = additional_args or {}
  vim.keymap.set(mode, keys, func, additional_args)
end

-- small utility function to make defining keymaps easier
function nmap_api(mode, keys, func, additional_args)
  additional_args = additional_args or {}
  vim.api.nvim_set_keymap(mode, keys, func, additional_args)
end

return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {

      inlay_hints = { enabled = false },
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        clangd = {
          mason = false,

        },
        --rust_analyzer = {
        --  mason = false,
        --},

        lua_ls = {
          Lua = {

            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = {
              disable = { "missing-fields" },
            }
          }

        },
      },
    },
  },

  {
    'mrcjkb/rustaceanvim',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/nvim-cmp',
    },
    ft = { 'rust' },
    config = function()
      vim.g.rustaceanvim = {
        float_win_config = {
          auto_focus = true,
          open_split = "vertical",
        },
        -- Plugin configuration
        tools = {},
        -- LSP configuration
        server = {
          -- on_attach = vim.g.rustaceanvim.server.on_attach,
          on_attach = function(client, bufnr)
            -- you can also put keymaps in here
            -- stylua: ignore start
            nmap(
              "n", "<leader>ca", function() vim.cmd.RustLsp("codeAction") end,
              { silent = true, buffer = bufnr }
            )
            nmap("n", "<s-k>", function() vim.cmd.RustLsp({ "hover", "actions" }) end)
            nmap(
              "n", "<leader>e", function() vim.cmd.RustLsp({ 'explainError', 'cycle' }) end,
              { desc = "Open [F]loating [D]iagnostic message" }
            )
            nmap("n", "<leader>df", function() vim.cmd.RustLsp("explainError") end)
            -- stylua: ignore stop
          end,
          default_settings = {
            -- rust-analyzer language server configuration
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                buildScripts = {
                  enable = true,
                },
              },
            },
            -- Add clippy lints for Rust
            checkOnSave = true,
            procMacro = {
              enable = true,
              ignored = {
                ["async-trait"] = { "async_trait" },
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
          },
        },
        -- DAP configuration
        dap = {},
      }
    end,
  }
}
