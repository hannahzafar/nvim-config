return {
  "coffebar/neovim-project",
  opts = {
    scope_chdir= "tab", -- change the working directory for the current tab only
    projects = {
      -- define project roots
      "/discover/nobackup/hzafar/tools-team-misc/projects/EarthNow/",
      "/discover/nobackup/hzafar/EarthNow/",
      "/gpfsm/dswdev/gmao-tools/Visualization/",
    },
    last_session_on_startup = false,
    dashboard_mode = true,
    picker = {
      type = "telescope",
    },
  },
  init = function()
    -- enable saving the state of plugins in the session
    vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
    { "Shatur/neovim-session-manager" },
  },
  lazy = false,
  keys = {
    {"<leader>pf", ":Telescope neovim-project discover<CR>", desc = "Find Projects" },
    {"<leader>ph", ":Telescope neovim-project history<CR>", desc = "Project History" },
    {"<leader>pr", ":NeovimProjectLoadRecent<CR>", desc = "Project Load Recent" },
  },
  priority = 100,
}
