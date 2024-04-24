return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {},
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  config = function()
    require('noice').setup {
      presets = {
        bottom_search = true,
        lsp_doc_border = true,
      },
      cmdline = {
        enabled = true,
        -- view = 'cmdline',
      },
    }
  end,
}
