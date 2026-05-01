-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
  -- Other pyright configurations can go here
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off", -- This disables type-checking
        -- You can also disable other diagnostics if needed:
        -- diagnosticMode = "off",
      },
    },
  },
})
