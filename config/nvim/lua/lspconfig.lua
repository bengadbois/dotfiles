local coq = require "coq"

require('lspconfig').gopls.setup{
  coq.lsp_ensure_capabilities(),
}
