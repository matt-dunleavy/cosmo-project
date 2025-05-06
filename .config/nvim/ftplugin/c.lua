-- Neovim C filetype plugin for multi-toolchain support
local api = vim.api
local fn = vim.fn
local lsp = vim.lsp

-- Check for toolchain indicator files
local function detect_toolchain()
    -- Check for .cosmo file to indicate Cosmopolitan toolchain
    if fn.filereadable('.cosmo') == 1 then
        return 'cosmo'
    end
    
    -- Default to gcc
    return 'gcc'
end

-- Set up LSP based on detected toolchain
local toolchain = detect_toolchain()

if toolchain == 'cosmo' then
    -- Cosmopolitan-specific settings
    lsp.buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    
    -- Add Cosmopolitan include paths
    local cosmo_include = fn.getcwd() .. '/tools/cosmocc/include'
    api.nvim_command('setlocal path+=' .. cosmo_include)
    
    -- Set up C compiler for Cosmopolitan
    api.nvim_command('compiler gcc')
    api.nvim_command('setlocal makeprg=make\\ TOOLCHAIN=cosmo')
else
    -- Standard GCC/Clang setup
    lsp.buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    api.nvim_command('compiler gcc')
    api.nvim_command('setlocal makeprg=make')
end

-- Common C settings
api.nvim_command('setlocal expandtab')
api.nvim_command('setlocal tabstop=4')
api.nvim_command('setlocal shiftwidth=4')
api.nvim_command('setlocal softtabstop=4')