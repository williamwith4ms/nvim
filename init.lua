require("keymaps")
require("config")
require("plugins.plugins")
require("plugins.config")
require("plugins.darkwhite").setup()

vim.api.nvim_create_user_command('ShowKeybinds', function()
	require('plugins.show_keybinds').show_keybinds()
end, {})
