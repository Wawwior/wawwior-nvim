return {
  'nvim-tree/nvim-tree.lua',

  opts = {},

  init = function()
    require('nvim-tree').setup()
  end,
}
