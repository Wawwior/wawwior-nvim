return {
  'nvim-tree/nvim-tree.lua',

  opts = {},

  init = function()
    require('nvim-tree').setup()
    vim.api.nvim_set_keymap('n', '<leader>tt', '<Cmd>:NvimTreeToggle<CR>', {
      desc = 'NvimTree: [T]oggle [T]ree',
    })
  end,
}
