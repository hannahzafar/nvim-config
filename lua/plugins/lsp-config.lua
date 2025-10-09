return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      {'mason-org/mason-lspconfig.nvim', opts={}},
      { 'j-hui/fidget.nvim', opts = {} },
      'saghen/blink.cmp',
    },
    init = function() --  This function gets run when an LSP attaches to a particular buffer.
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
    -- init = function ()
    --   vim.api.nvim_create_autocmd("LspAttach", {
    --     group = vim.api.nvim_create_augroup("ansauto_lsp", {clear = true}),
    --     callback = function (_)
    --       vim.diagnostic.config({ virtual_text = true })
          -- local nmap = function(lhs, rhs, desc)
          --   local opts = { silent=true, buffer=0, desc=desc }
          --   vim.keymap.set({"n", "x"}, lhs, rhs, opts)
          -- end
          -- nmap('gd', vim.lsp.buf.definition, "Goto definition")
          -- nmap('gD', vim.lsp.buf.declaration, "Goto declaration")
          -- nmap('gry', vim.lsp.buf.type_definition, "Goto type definition")
          -- nmap('<leader>gz', function()
          -- Toggle on off LSP diagnostics
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end
          map('<leader>ld', function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end, "Toggle [d]iagnostics")
        end
      })
    end,
    opts = {
      servers = {
        -- bashls = {
        --   filetypes = {"sh", "zsh"}
        -- },
        pyright = {
          settings = {
            pyright = { disableOrganizeImports = true },
          }
        },
        ruff = {
          init_options = {
            settings = {
              format = { enable = true },
              lint = { enable = false}, -- use ruff exclusively as a formatter
            }
          }
        },
        lua_ls = {
          settings = { Lua = {diagnostics = {globals = {"vim"}}} }
        },
      },
    },
    config = function(_, opts)
      for server, config in pairs(opts.servers) do
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
    end,
    -- Diagnostic Config
    -- See :help vim.diagnostic.Opts
    vim.diagnostic.config {
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
      } or {},
      virtual_text = {
        source = 'if_many',
        spacing = 2,
        format = function(diagnostic)
          local diagnostic_message = {
            [vim.diagnostic.severity.ERROR] = diagnostic.message,
            [vim.diagnostic.severity.WARN] = diagnostic.message,
            [vim.diagnostic.severity.INFO] = diagnostic.message,
            [vim.diagnostic.severity.HINT] = diagnostic.message,
          }
          return diagnostic_message[diagnostic.severity]
        end,
      },
    }
  },
}
