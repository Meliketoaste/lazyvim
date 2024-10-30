return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({
        fzf = {
          ---https://github.com/ibhagwan/fzf-lua/issues/546#issuecomment-1736076539
          ["ctrl-q"] = "select-all+accept",
        },
        grep = {
          rg_glob = true,
          -- first returned string is the new search query
          -- second returned string are (optional) additional rg flags
          -- @return string, string?
          rg_glob_fn = function(query, opts)
            local regex, flags = query:match("^(.-)%s%-%-(.*)$")
            -- If no separator is detected will return the original query
            return (regex or query), flags
          end
        }
      })
    end
  }
}
