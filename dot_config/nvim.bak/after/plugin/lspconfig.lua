vim.keymap.set("n", "<space>d", vim.diagnostic.open_float)

return {
	"neovim/nvim-lspconfig",
	opts = {
		-- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
		inlay_hints = {
			enabled = true,
		},
		format = {
			timeout_ms = 10000, -- 10 seconds
		},
	},
}
