vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.laststatus = 2
vim.opt.mouse = 'a'
vim.opt.termguicolors = true

-- Plugins will be downloaded under the specified directory.
local Plug = vim.fn['plug#']
vim.call('plug#begin', vim.fn.stdpath('data') .. '/plugged')

-- Declare the list of plugins.
Plug('neoclide/coc.nvim', { branch = 'release' })
Plug('sheerun/vim-polyglot')
Plug('itchyny/lightline.vim')
Plug('iamcco/markdown-preview.nvim', {
  ['do'] = function() vim.fn['mkdp#util#install']() end,
  ['for'] = { 'markdown', 'vim-plug' },
})
Plug('rafi/awesome-vim-colorschemes')
Plug('logico/typewriter-vim')

-- List ends here. Plugins become visible to Vim after this call.
vim.call('plug#end')

vim.g.coc_global_extensions = {
  'coc-json',
  'coc-html',
  'coc-css',
  'coc-tsserver',
  'coc-eslint',
  'coc-prettier',
  'coc-pairs',
}

-- use <tab> for trigger completion and navigate to the next complete item
local function check_backspace()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

vim.keymap.set('i', '<Tab>', function()
  if vim.fn['coc#pum#visible']() == 1 then
    return vim.fn['coc#pum#next'](1)
  end
  if check_backspace() then
    return '\t'
  end
  return vim.fn['coc#refresh']()
end, { silent = true, expr = true, replace_keycodes = false })

local function update_lightline()
  vim.fn['lightline#init']()
  vim.fn['lightline#colorscheme']()
  vim.fn['lightline#update']()
end

local function dark_mode()
  vim.opt.background = 'dark'
  vim.cmd.colorscheme('onedark')
  vim.g.lightline = { colorscheme = 'onedark' }
  update_lightline()
end

local function eink_mode()
  vim.opt.background = 'light'
  vim.cmd.colorscheme('typewriter')
  vim.g.lightline = { colorscheme = 'one' }
  update_lightline()
end

vim.api.nvim_create_user_command('DarkMode', dark_mode, { nargs = 0 })
vim.api.nvim_create_user_command('EInkMode', eink_mode, { nargs = 0 })

dark_mode()

vim.cmd.syntax('on')

vim.api.nvim_create_user_command('Prettier', function()
  vim.fn.CocAction('runCommand', 'prettier.formatFile')
end, { nargs = 0 })
