require('nvim-treesitter.configs').setup{
  ensure_installed = {
    'go', 'lua', 'python', 'rust', 'typescript', 'regex',
    'bash', 'markdown', 'markdown_inline', 'kdl', 'sql', 'terraform',
    'html', 'css', 'javascript', 'typescript',
    'yaml', 'json', 'toml', 'vim', 'vimdoc'},
  sync_install = false,
  auto_install = false,
  ignore_install = {'org'},
  highlight = { enable = true },
  indent = { enable = true },
}
