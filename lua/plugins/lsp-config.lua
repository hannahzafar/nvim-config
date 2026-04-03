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
          -- Helper function for keymaps
          local nmap = function(lhs, rhs, desc)
            local opts = { silent=true, buffer=event.buf, desc=desc }
            vim.keymap.set("n", lhs, rhs, opts)
          end
          
          local vmap = function(lhs, rhs, desc)
            local opts = { silent=true, buffer=event.buf, desc=desc }
            vim.keymap.set("v", lhs, rhs, opts)
          end

          -- Get telescope builtin for LSP pickers
          local builtin = require('telescope.builtin')

          -- ========================================================================
          -- Navigation mappings (goto) using Telescope for better UI with preview
          -- ========================================================================
          nmap('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
          nmap('gr', builtin.lsp_references, '[G]oto [R]eferences')
          nmap('gi', builtin.lsp_implementations, '[G]oto [I]mplementation')
          nmap('gt', builtin.lsp_type_definitions, '[G]oto [T]ype definition')
          nmap('gs', builtin.lsp_document_symbols, '[G]oto [S]ymbol (document)')
          nmap('gS', builtin.lsp_dynamic_workspace_symbols, '[G]oto [S]ymbol (workspace)')
          nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- ========================================================================
          -- Hover documentation
          -- ========================================================================
          nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

          -- ========================================================================
          -- LSP Actions under <leader>l
          -- ========================================================================
          -- NOTE: These mappings override Neovim 0.11+ built-in LSP mappings:
          --   - grn (rename) → we use <leader>lr for better which-key discoverability
          --   - gra (code action) → we use <leader>la for better which-key discoverability
          --   - grr (references) → we override with 'gr' using Telescope for better UI
          -- If you prefer the built-in gr* mappings, comment out the conflicting mappings above
          -- and remove the telescope-based 'gr' mapping.
          
          nmap('<leader>lr', vim.lsp.buf.rename, '[L]SP [R]ename')
          nmap('<leader>la', vim.lsp.buf.code_action, '[L]SP Code [A]ction')
          vmap('<leader>la', vim.lsp.buf.code_action, '[L]SP Code [A]ction')
          
          nmap('<leader>lf', vim.lsp.buf.format, '[L]SP [F]ormat')
          vmap('<leader>lf', vim.lsp.buf.format, '[L]SP [F]ormat selection')
          
          nmap('<leader>lh', vim.lsp.buf.hover, '[L]SP [H]over Documentation')
          nmap('<leader>ls', vim.lsp.buf.signature_help, '[L]SP [S]ignature Help')

          -- ========================================================================
          -- Diagnostics under <leader>l
          -- ========================================================================
          nmap('<leader>ld', vim.diagnostic.open_float, '[L]SP [D]iagnostic float')
          nmap('<leader>lt', function() 
            vim.diagnostic.enable(not vim.diagnostic.is_enabled()) 
          end, '[L]SP [T]oggle diagnostics')

          -- ========================================================================
          -- Diagnostic navigation
          -- ========================================================================
          nmap(']d', vim.diagnostic.goto_next, 'Next [D]iagnostic')
          nmap('[d', vim.diagnostic.goto_prev, 'Previous [D]iagnostic')
          nmap(']e', function() 
            vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) 
          end, 'Next [E]rror')
          nmap('[e', function() 
            vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) 
          end, 'Previous [E]rror')
        end
      })
    end,
    opts = {
      servers = {
        bashls = {
          filetypes = {"sh", "zsh"},
        },
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
