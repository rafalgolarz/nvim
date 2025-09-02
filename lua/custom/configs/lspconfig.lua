local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      gofumpt = true,
      completeUnimported = true,
      usePlaceholders = true,
      staticcheck = true,
      semanticTokens = true,
      codelenses = { 
        gc_details = false,
        generate = true,
        regenerate_cgo = true,
        run_govulncheck = true,
        test = true, tidy = true,
        upgrade_dependency = true,
        vendor = true, 
      },
      analyses = {
        unusedparams = true,
        nilness = true, 
        unusedparams = true, 
        unusedwrite = true, 
        useany = true,
      },
      hints = { 
        assignVariableTypes = true, 
        compositeLiteralFields = true, 
        compositeLiteralTypes = true, 
        constantValues = true, 
        functionTypeParameters = true, 
        parameterNames = true, 
        rangeVariableTypes = true, 
        literalCompositeValues = true,
      },
      directoryFilters = {
        "-.git",
        "-.vscode",
        "-.idea",
        "-.vscode-test",
        "-node_modules",
        "-.nvim"
      },
    },
  },
}
