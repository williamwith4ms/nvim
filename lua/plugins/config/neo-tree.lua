require("neo-tree").setup({
  auto_close = true,
  enable_git_status = true,
  popup_border_style = "rounded",
  window = {
    mappings = {
      ["P"] = {"toggle_preview", config = { use_float = true, use_image_nvim = true } },
    },
  },
})
