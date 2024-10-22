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

-- Nvim-tree
keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>', { desc = '[T]oggle [T]ree' }) -- toggle file explorer
keymap.set('n', '<leader>gf', ':NvimTreeFindFile<CR>', { desc = '[G]oto [F]ile' }) -- find file in file explorer

-- BarBar
keymap.set({ 'n', 'i' }, '<C-Tab>', '<Cmd>BufferNext<CR>', {})
keymap.set({ 'n', 'i' }, '<C-S-Tab>', '<Cmd>BufferPrevious<CR>', {})

keymap.set({ 'n', 'i' }, '<C-x>', '<Cmd>BufferClose<CR>', { desc = '[B]uffer [C]lose' })
keymap.set({ 'n', 'i' }, '<C-S-x>', '<Cmd>BufferClose!<CR>', { desc = '[B]uffer force [C]lose' })
keymap.set({ 'n', 'i' }, '<leader>bn', '<Cmd>enew<CR>', { desc = '[B]uffer [N]ew' })

keymap.set({ 'n', 'i' }, '<A-1>', '<Cmd>BufferGoto 1<CR>', { desc = '[B]uffer [G]oto [1]' })
keymap.set({ 'n', 'i' }, '<A-2>', '<Cmd>BufferGoto 2<CR>', { desc = '[B]uffer [G]oto [2]' })
keymap.set({ 'n', 'i' }, '<A-3>', '<Cmd>BufferGoto 3<CR>', { desc = '[B]uffer [G]oto [3]' })
keymap.set({ 'n', 'i' }, '<A-4>', '<Cmd>BufferGoto 4<CR>', { desc = '[B]uffer [G]oto [4]' })
keymap.set({ 'n', 'i' }, '<A-5>', '<Cmd>BufferGoto 5<CR>', { desc = '[B]uffer [G]oto [5]' })
keymap.set({ 'n', 'i' }, '<A-6>', '<Cmd>BufferGoto 6<CR>', { desc = '[B]uffer [G]oto [6]' })
keymap.set({ 'n', 'i' }, '<A-7>', '<Cmd>BufferGoto 7<CR>', { desc = '[B]uffer [G]oto [7]' })
keymap.set({ 'n', 'i' }, '<A-8>', '<Cmd>BufferGoto 8<CR>', { desc = '[B]uffer [G]oto [8]' })
keymap.set({ 'n', 'i' }, '<A-9>', '<Cmd>BufferGoto 9<CR>', { desc = '[B]uffer [G]oto [9]' })
keymap.set({ 'n', 'i' }, '<A-0>', '<Cmd>BufferGoto 10<CR>', { desc = '[B]uffer [G]oto 1[0]' })

-- LazyGit
keymap.set('n', '<leader>lg', '<cmd>LazyGit<cr>', { desc = '[L]azy[G]it' })

-- Octo
keymap.set('n', '<leader>o', '<cmd>Octo actions<cr>', { desc = '[O]cto' })

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
end, { desc = '[F]ormat' })
keymap.set('v', '<leader>f', function()
  conform.format({ async = true, lsp_format = 'fallback' }, function(err)
    if not err then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', true)
    end
  end)
end, { desc = '[F]ormat' })

-- LSP
keymap.set('n', '<leader>gg', vim.lsp.buf.hover, { desc = '' })
keymap.set('n', '<leader>gd', telescope.lsp_definitions, { desc = '[G]oto [D]efinition' })
keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]ecleration' })
keymap.set('n', '<leader>gi', telescope.lsp_implementations, { desc = '[G]oto [I]mplementation' })
keymap.set('n', '<leader>gt', telescope.lsp_type_definitions, { desc = '[G]oto [T]ype Definition' })
keymap.set('n', '<leader>gr', telescope.lsp_references, { desc = '[G]oto [R]eferences' })
keymap.set('n', '<leader>gs', vim.lsp.buf.signature_help, { desc = '' })
keymap.set('n', '<leader>rr', vim.lsp.buf.rename, { desc = '[R]ename' })
keymap.set('n', '<A-CR>', vim.lsp.buf.code_action)
keymap.set('n', '<leader>gl', vim.diagnostic.open_float, { desc = '' })
keymap.set('n', '<leader>gp', vim.diagnostic.goto_prev, { desc = '' })
keymap.set('n', '<leader>gn', vim.diagnostic.goto_next, { desc = '' })
keymap.set('n', '<leader>tr', telescope.lsp_document_symbols, { desc = '' })
keymap.set('i', '<C-Space>', vim.lsp.buf.completion)
keymap.set('n', '<leader>q', telescope.diagnostics, { desc = 'Open Diagnostics' })

-- Filetype-specific keymaps (these can be done in the ftplugin directory instead if you prefer)
keymap.set('n', '<leader>go', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').organize_imports()
  end
end, { desc = '[O]rganize Imports' })

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
