local config = function()
require("nvim-tree").setup({
        sort_by = "case_sensitive",
        actions = {
          open_file = {
            quit_on_open = false,
          },
        },
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
      })

end

-- vim.keymap.set("n", "<space>t", require("nvim-tree.api").tree.toggle, {
--     silent = true,
--     desc = "toggle nvim-tree",
--   })

return {
  { -- https://github.com/nvim-tree/nvim-tree.lua
    "nvim-tree/nvim-tree.lua",
    version = "*",
    cmd = { "NvimTreeToggle", "NvimTreeOpen" },
    keys = {
      { "<Leader>t", vim.cmd.NvimTreeToggle, desc = "NvimTree Toggle" },
    },
    config = config
  },
}


