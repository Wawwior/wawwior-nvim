return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts = {
    preset = 'modern',
  },
  keys = { {
    '<leader>?',
    function()
      require('which-key').show { global = false }
    end,
    desc = 'Buffer Local Keymaps (which-key)',
  } },
  config = function(_, opts) -- This is the function that runs, AFTER loading
    require('which-key').setup(opts)

    -- Document existing key chains
    require('which-key').add {
      { '<leader>b', group = '[B]uffer' },
      { '<leader>bg', group = '[B]uffer [G]oto' },
      { '<leader>c', group = '[C]ode' },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>h', group = 'Git [H]unk' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>g', group = '[G]oto' },
    }
    -- visual mode
    require('which-key').add {
      { '<leader>h', desc = 'Git [H]unk', mode = 'v' },
    }
  end,
}
