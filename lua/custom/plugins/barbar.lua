return {
  'romgrk/barbar.nvim',
  opts = {},
  init = function()
    vim.g.barbar_auto_setup = false

    require('barbar').setup {
      sidebar_filetypes = {
        NvimTree = true,
      },
    }

    local map = function(mode, lhs, rhs)
      vim.api.nvim_set_keymap(mode, lhs, rhs, {
        noremap = true,
        silent = true,
      })
    end

    map('n', '<C-Tab>', '<Cmd>BufferNext<CR>')
    map('n', '<C-S-Tab>', '<Cmd>BufferPrevious<CR>')
    map('n', '<leader>x', '<Cmd>BufferClose<CR>')
  end,
}
