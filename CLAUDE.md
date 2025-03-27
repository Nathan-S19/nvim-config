# Neovim Configuration Guidelines

## Commands
- `:checkhealth kickstart.nvim` - Verify configuration health
- `:Lazy` - Manage plugins (update, clean, etc.)
- `:Mason` - Manage LSP servers and tools
- `:TSUpdate` - Update Treesitter language parsers
- `:Telescope` - Open fuzzy finder interface
- `:Neotree` - Open file tree browser
- `:Dashboard` - Open dashboard start screen

## Code Style Guidelines
- **Indentation**: 2 spaces (ts=2 sts=2 sw=2 et)
- **Files**: Organize custom plugins in `lua/custom/plugins/`
- **Plugin Format**: Use tables with link/name followed by config options
- **Functions**: Use camelCase for function names
- **Variables**: Use snake_case for variable names
- **Documentation**: Include descriptive comments explaining purpose
- **Keymaps**: Document with descriptive strings using [bracketed notation]
- **Error Handling**: Use pcall pattern for safe loading of optional components
- **Formatting**: Use stylua (installed via Mason) for Lua formatting
- **Dependencies**: Requires git, make, unzip, ripgrep (rg)

## External Tools
- Lazy.nvim for plugin management
- Mason for LSP server management
- Treesitter for syntax parsing
- Telescope for fuzzy finding
- Lualine for enhanced statusline
- Dashboard-nvim for custom start screen

## UI Customizations
To make additional UI customizations, consider:
1. **Colorscheme variations**: `vim.g.gruvbox_material_background = 'medium'` (options: 'hard', 'medium', 'soft')
2. **Custom highlights**: Use `vim.cmd.hi 'Comment gui=italic'` to modify specific syntax elements
3. **Icons**: Make sure you have a Nerd Font installed for proper icon display
4. **Transparency**: Some themes support transparency with `vim.g.theme_transparent_bg = true`

## Aesthetic Features
The configuration includes several visual enhancements:

1. **Enhanced Status Line (Lualine)**:
   - Git branch and diff information
   - LSP diagnostics and active server indicators
   - Customized sections with file info and editor state
   - Word count for markdown files

2. **Dashboard Start Screen**:
   - Synthwave-inspired ASCII art header
   - Dynamic date/time display
   - Quick action shortcuts
   - Recent files and project lists
   - Random inspirational programming quotes that change each session

3. **Indent Guides**:
   - Vertical indent guide lines
   - Scope highlighting for current context

4. **Gruvbox Customizations**:
   - Italic comments and bold functions
   - Enhanced cursor line visibility
   - Custom highlight colors for specific syntax elements