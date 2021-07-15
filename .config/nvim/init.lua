require("globals")
require("window_local")
require("buffer_local")
require('plugins')
require('lsp_config')
require('keybindings')
require('treesitter_conf')
-- plugin options
vim.g.vimtex_view_method = 'zathura'
vim.cmd("let g:vimwiki_list = [{'path': '~/Documenti/Vimwiki/vimwiki', 'path_html': '~/Documenti/Vimwiki/Html/'}]")

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
  };
}
