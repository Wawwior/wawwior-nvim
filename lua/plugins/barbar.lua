return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    clickable = false,
    icons = {
      buffer_index = true,
      button = '',
    },
    sidebar_filetypes = {
      NvimTree = true,
    },
    auto_hide = 1,
    minimum_padding = 1,
    maximum_padding = 200,
  },
}
