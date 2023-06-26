local M = {}

M.null_packages = {
  lua = {
    stylua = { method = "formatting" },
    -- selene = { method = "diagnostics" },
  },
  python = {
    ruff = { method = "formatting" },
    mypy = { method = "diagnostics" },
  },
  zsh = { zsh = { method = "diagnostics", mason = false }},
}

M.null_installs = {}
for _, pkgs in pairs(M.null_packages) do
  for name, pkg in pairs(pkgs) do
    if pkg.mason == nil or pkg.mason then
      table.insert(M.null_installs, name)
    end
  end
end

M.null_filetypes = {}
for lang, _ in pairs(M.null_packages) do
  table.insert(M.null_filetypes, lang)
end

local null_opts = { sources = {} }
function M.get_options()
  local null = require("null-ls")
  for _, pkgs in pairs(M.null_packages) do
    for name, pkg in pairs(pkgs) do
      table.insert(null_opts.sources, null.builtins[pkg.method][name])
    end
  end
  return null_opts
end

M.defaults = {
  capabilities = vim.tbl_deep_extend(
    "force",
    vim.lsp.protocol.make_client_capabilities(),
    require("cmp_nvim_lsp").default_capabilities()
  )
}
M.defaults.capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

return M
