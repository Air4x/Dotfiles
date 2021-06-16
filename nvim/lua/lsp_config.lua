-- lsp config --
--- rust
require'lspconfig'.rls.setup{}

--- bash
require'lspconfig'.bashls.setup{}

--- lua
---- TODO: install sumneko lua LS

--- python
require'lspconfig'.pyright.setup{}

--- css
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.cssls.setup{
    capabilities = capabilities,
}
--- html
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
}
