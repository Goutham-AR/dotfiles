return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "saghen/blink.cmp",
  },
  config = function()
    -- local builtin = require("telescope.builtin")

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
      callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        local map = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("grn", vim.lsp.buf.rename, "[R]e[n]ame")

        map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
        map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition", { "n", "x" })

        -- Using native Neovim LSP functions (quickfix list) instead of Telescope pickers
        -- map("grr", builtin.lsp_references, "[G]oto [R]eferences")
        map("grr", vim.lsp.buf.references, "[G]oto [R]eferences")

        -- map("gri", builtin.lsp_implementations, "[G]oto [I]mplementation")
        map("gri", vim.lsp.buf.implementation, "[G]oto [I]mplementation")

        -- map("grd", builtin.lsp_definitions, "[G]oto [D]efinition")
        map("grd", vim.lsp.buf.definition, "[G]oto [D]efinition")

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header.
        map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

        -- Find all the symbols in your current document.
        --  Symbols are things like variables, functions, types, etc.
        -- map("<leader>ds", builtin.lsp_document_symbols, "Open Document Symbols")
        map("<leader>ds", vim.lsp.buf.document_symbol, "Open Document Symbols")

        -- Find all the symbols in your current workspace.
        --  Similar to document symbols, except searches over your entire project.
        -- map("gW", builtin.lsp_workspace_symbols, "Open Workspace Symbols")
        map("gW", vim.lsp.buf.workspace_symbol, "Open Workspace Symbols")

        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        -- map("grt", builtin.lsp_type_definitions, "[G]oto [T]ype Definition")
        map("grt", vim.lsp.buf.type_definition, "[G]oto [T]ype Definition")

        -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
        ---@param client vim.lsp.Client
        ---@param method vim.lsp.protocol.Method
        ---@param bufnr? integer some lsp support methods only in specific files
        ---@return boolean
        local function client_supports_method(client, method, bufnr)
          if vim.fn.has("nvim-0.11") == 1 then
            return client:supports_method(method, bufnr)
          else
            return client.supports_method(method, { bufnr = bufnr })
          end
        end

        vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { desc = "Hover Docs" })
        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
          map("<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
          end, "[T]oggle Inlay [H]ints")
        end
      end,
    })

    -- Diagnostic Config
    -- See :help vim.diagnostic.Opts
    vim.diagnostic.config({
      severity_sort = true,
      float = { border = "rounded", source = "if_many" },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚 ",
          [vim.diagnostic.severity.WARN] = "󰀪 ",
          [vim.diagnostic.severity.INFO] = "󰋽 ",
          [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
      } or {},
    })

    local capabilities = require("blink.cmp").get_lsp_capabilities()

    local servers = {
      clangd = {},
      gopls = {},
      pyright = {},
      rust_analyzer = {},
      zls = {},
      ts_ls = {},
      cmake = {},
      bashls = {},
      fish_lsp = {},
      azure_pipelines_ls = {},
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
            diagnostics = { disable = { "missing-fields" } },
          },
        },
      },
    }
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      "stylua", -- Used to format Lua code
    })

    require("mason").setup({
      registries = { "github:mason-org/mason-registry", "github:Crashdummyy/mason-registry" },
    })
    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

    require("mason-lspconfig").setup({
      ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
      automatic_installation = false,
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
          require("lspconfig")[server_name].setup(server)
        end,
      },
    })
  end,
}
