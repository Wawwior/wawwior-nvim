return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false
    local map = vim.api.nvim_set_keymap
    map('n', '<C-Tab>', '<Cmd>BufferNext<CR>', {})
    map('n', '<C-S-Tab>', '<Cmd>BufferPrevious<CR>', {})

    map('n', '<leader>bc', '<Cmd>BufferClose<CR>', { desc = '[B]uffer [C]lose' })
    map('n', '<leader>bn', '<Cmd>enew<CR>', { desc = '[B]uffer [N]ew' })

    map('n', '<leader>bg1', '<Cmd>BufferGoto 1<CR>', { desc = '[B]uffer [G]oto [1]' })
    map('n', '<leader>bg2', '<Cmd>BufferGoto 2<CR>', { desc = '[B]uffer [G]oto [2]' })
    map('n', '<leader>bg3', '<Cmd>BufferGoto 3<CR>', { desc = '[B]uffer [G]oto [3]' })
    map('n', '<leader>bg4', '<Cmd>BufferGoto 4<CR>', { desc = '[B]uffer [G]oto [4]' })
    map('n', '<leader>bg5', '<Cmd>BufferGoto 5<CR>', { desc = '[B]uffer [G]oto [5]' })
    map('n', '<leader>bg6', '<Cmd>BufferGoto 6<CR>', { desc = '[B]uffer [G]oto [6]' })
    map('n', '<leader>bg7', '<Cmd>BufferGoto 7<CR>', { desc = '[B]uffer [G]oto [7]' })
    map('n', '<leader>bg8', '<Cmd>BufferGoto 8<CR>', { desc = '[B]uffer [G]oto [8]' })
    map('n', '<leader>bg9', '<Cmd>BufferGoto 9<CR>', { desc = '[B]uffer [G]oto [9]' })
    map('n', '<leader>bg0', '<Cmd>BufferGoto 10<CR>', { desc = '[B]uffer [G]oto 1[0]' })
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
