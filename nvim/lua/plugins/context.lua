return {
  'nvim-treesitter/nvim-treesitter-context',
  opts = {
    enable = true,
    throttle = true,
    max_lines = 3,          -- show up to 3 lines of context
    patterns = {            -- match these nodes
      default = { 'class', 'function', 'method', 'for', 'while', 'if', 'switch', 'case' },
      go = { 'function_declaration', 'method_declaration' },
    },
  },
}
