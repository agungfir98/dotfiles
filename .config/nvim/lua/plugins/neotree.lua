return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  config = function()
    require("neo-tree").setup({
      window = {
        width = 30,
      },
    })
  end,
}
