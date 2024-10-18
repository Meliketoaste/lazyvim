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
      },
    },
  },
}
