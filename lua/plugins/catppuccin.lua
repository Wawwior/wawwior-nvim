return { -- You can easily change to a different colorscheme.
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  opts = {
    flavour = 'mocha',
    integrations = {
      barbar = true,
      mason = true,
      which_key = true,
    },
    color_overrides = {
      mocha = {},
    },
  },
  init = function()
    vim.cmd.colorscheme 'catppuccin'
  end,
}
