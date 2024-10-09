-- Set leader key to space
vim.g.mapleader = ' '

local keymap = vim.keymap

-- General keymaps
keymap.set('n', 'gx', ':!xdg-open <c-r><c-a><CR>') -- open URL under cursor
keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Split window management
keymap.set('n', '<leader>sv', '<C-w>v') -- split window vertically
keymap.set('n', '<leader>sh', '<C-w>s') -- split window horizontally
keymap.set('n', '<leader>se', '<C-w>=') -- make split windows equal width
keymap.set('n', '<leader>sx', ':close<CR>') -- close split window
keymap.set('n', '<leader>sj', '<C-w>-') -- make split window height shorter
keymap.set('n', '<leader>sk', '<C-w>+') -- make split windows height taller
keymap.set('n', '<leader>sl', '<C-w>>5') -- make split windows width bigger
keymap.set('n', '<leader>sh', '<C-w><5') -- make split windows width smaller

-- Tab management
keymap.set('n', '<leader>to', ':tabnew<CR>') -- open a new tab
keymap.set('n', '<leader>tx', ':tabclose<CR>') -- close a tab
keymap.set('n', '<leader>tn', ':tabn<CR>') -- next tab
keymap.set('n', '<leader>tp', ':tabp<CR>') -- previous tab

-- Nvim-tree
keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>', { desc = '[t]oggle [t]ree' }) -- toggle file explorer
keymap.set('n', '<leader>gf', ':NvimTreeFindFile<CR>', { desc = '[g]oto [f]ile' }) -- find file in file explorer

-- BarBar
keymap.set('n', '<C-Tab>', '<Cmd>BufferNext<CR>', {})
keymap.set('n', '<C-S-Tab>', '<Cmd>BufferPrevious<CR>', {})

keymap.set('n', '<leader>bc', '<Cmd>BufferClose<CR>', { desc = '[B]uffer [C]lose' })
keymap.set('n', '<leader>bn', '<Cmd>enew<CR>', { desc = '[B]uffer [N]ew' })

keymap.set('n', '<leader>bg1', '<Cmd>BufferGoto 1<CR>', { desc = '[B]uffer [G]oto [1]' })
keymap.set('n', '<leader>bg2', '<Cmd>BufferGoto 2<CR>', { desc = '[B]uffer [G]oto [2]' })
keymap.set('n', '<leader>bg3', '<Cmd>BufferGoto 3<CR>', { desc = '[B]uffer [G]oto [3]' })
keymap.set('n', '<leader>bg4', '<Cmd>BufferGoto 4<CR>', { desc = '[B]uffer [G]oto [4]' })
keymap.set('n', '<leader>bg5', '<Cmd>BufferGoto 5<CR>', { desc = '[B]uffer [G]oto [5]' })
keymap.set('n', '<leader>bg6', '<Cmd>BufferGoto 6<CR>', { desc = '[B]uffer [G]oto [6]' })
keymap.set('n', '<leader>bg7', '<Cmd>BufferGoto 7<CR>', { desc = '[B]uffer [G]oto [7]' })
keymap.set('n', '<leader>bg8', '<Cmd>BufferGoto 8<CR>', { desc = '[B]uffer [G]oto [8]' })
keymap.set('n', '<leader>bg9', '<Cmd>BufferGoto 9<CR>', { desc = '[B]uffer [G]oto [9]' })
keymap.set('n', '<leader>bg0', '<Cmd>BufferGoto 10<CR>', { desc = '[B]uffer [G]oto 1[0]' })

-- Telescope
local telescope = require 'telescope.builtin'
keymap.set('n', '<leader>sf', telescope.find_files, { desc = 'Find [F]iles' })
keymap.set('n', '<leader>sg', telescope.live_grep, { desc = 'Live [G]rep' })
keymap.set('n', '<leader>sb', telescope.buffers, { desc = 'Find [B]uffer' })
keymap.set('n', '<leader>sh', telescope.help_tags, { desc = 'Search [H]elp' })
keymap.set('n', '<leader>/', telescope.current_buffer_fuzzy_find, { desc = 'Fuzzy Find' })

-- Conform
local conform = require 'conform'
keymap.set('n', '<leader>f', function()
  conform.format { async = true, lsp_format = 'fallback' }
end, { desc = '[f]ormat' })
keymap.set('v', '<leader>f', function()
  conform.format({ async = true, lsp_format = 'fallback' }, function(err)
    if not err then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', true)
    end
  end)
end, { desc = '[f]ormat' })

-- LSP
keymap.set('n', '<leader>gg', vim.lsp.buf.hover, { desc = '' })
keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { desc = '[g]oto [d]efinition' })
keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, { desc = '[g]oto [D]ecleration' })
keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { desc = '[g]oto [i]mplementation' })
keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition, { desc = '[g]oto [t]ype Definition' })
keymap.set('n', '<leader>gr', vim.lsp.buf.references, { desc = '[g]oto [r]eferences' })
keymap.set('n', '<leader>gs', vim.lsp.buf.signature_help, { desc = '' })
keymap.set('n', '<leader>rr', vim.lsp.buf.rename, { desc = '[r]ename' })
keymap.set('n', '<A-CR>', vim.lsp.buf.code_action)
keymap.set('n', '<leader>gl', vim.diagnostic.open_float, { desc = '' })
keymap.set('n', '<leader>gp', vim.diagnostic.goto_prev, { desc = '' })
keymap.set('n', '<leader>gn', vim.diagnostic.goto_next, { desc = '' })
keymap.set('n', '<leader>tr', vim.lsp.buf.document_symbol, { desc = '' })
keymap.set('i', '<C-Space>', vim.lsp.buf.completion)

-- Filetype-specific keymaps (these can be done in the ftplugin directory instead if you prefer)
keymap.set('n', '<leader>go', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').organize_imports()
  end
end)

keymap.set('n', '<leader>gu', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').update_projects_config()
  end
end)

keymap.set('n', '<leader>tc', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').test_class()
  end
end)

keymap.set('n', '<leader>tm', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').test_nearest_method()
  end
end)
