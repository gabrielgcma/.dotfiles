return {
  {
    "folke/snacks.nvim",
    opts = {
      lazygit = {
        -- set to false to use your own lazygit config
        -- and prevent snacks from overriding it with neovim colors
        configure = false,
        win = {
          wo = {
            -- Force the floating window to use the default Normal background
            -- instead of the (often lighter) NormalFloat background
            winhighlight = "Normal:Normal",
          },
        },
      },
    },
  },
}
