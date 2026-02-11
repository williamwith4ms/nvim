local wk = require("which-key")

wk.setup({
  delay = 0,
})

wk.add({
  { "<leader>d", group = "DAP" },
  { "<leader>f", group = "Telescope" },
})
