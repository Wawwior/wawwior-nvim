return {
  'nvim-tree/nvim-tree.lua',

  opts = {},

  init = function()
    vim.api.nvim_set_keymap('n', '<leader>tt', '<Cmd>NvimTreeToggle<CR>', {
      desc = 'NvimTree: [T]oggle [T]ree',
    })
  end,
}
