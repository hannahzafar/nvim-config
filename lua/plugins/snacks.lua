return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- Replaces nvim-notify (no message cutoff bugs)
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    -- Replaces dressing.nvim for nice UI popups
    input = {
      enabled = true,
    },
    -- Optional: nice status column, words, etc.
  },
}
