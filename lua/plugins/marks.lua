return {
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "<leader>mt", ":MarksToggleSigns<CR>", desc = "[T]oggle mark signs" },
      { "<leader>ml", ":MarksListBuf<CR>", desc = "[L]ist marks in buffer" },
    },
  }
}
