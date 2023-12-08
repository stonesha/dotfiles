return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "jose-elias-alvarez/typescript.nvim",
      dependencies = {
        "davidosomething/format-ts-errors.nvim",
      },
    },
  },
  ---@class PluginLspOpts
  opts = {
    servers = {
    tsserver = {
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayVariableTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayVariableTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      },
    },
    -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
    inlay_hints = {
      enabled = true,
    },
    format = {
      timeout_ms = 10000, -- 10 seconds
    },
  },
}
