return {
  {
    "olimorris/codecompanion.nvim",
    keys = {
      {"<leader>ac", function() require("codecompanion").toggle() end, desc= "AI [C]hat"},
      {"<leader>aa", function() require("codecompanion").actions() end, desc= "AI [A]ctions"},
    },
    opts = {
      strategies = {
        chat = { adapter = "nasa_ai" },
        inline = { adapter = "nasa_ai" },
        cmd = { adapter = "nasa_ai" }
      },
      adapters = {
        nasa_ai = function ()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "https://bedrock-code-api.genai.mcp.nasa.gov",
              api_key = nil,
              chat_url = "/v1/chat/completions",
              models_endpoint = "/v1/models"
            },
            schema = {
              model = {
                default = "bedrock-claude-3.5-sonnet"
              }
            }
          })
        end
      }
    },
      dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    }
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ft = { "codecompanion" },
  }
}

