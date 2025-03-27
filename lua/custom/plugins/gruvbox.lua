return {
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000,
  config = function()
    -- Configure gruvbox-material options before loading the colorscheme
    vim.g.gruvbox_material_background = "medium" -- Options: "hard", "medium", "soft"
    vim.g.gruvbox_material_better_performance = 1
    vim.g.gruvbox_material_enable_bold = 1
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_cursor = "auto"
    vim.g.gruvbox_material_ui_contrast = "high" -- Options: "low", "high"
    vim.g.gruvbox_material_diagnostic_line_highlight = 1
    
    -- Load the colorscheme
    vim.cmd.colorscheme("gruvbox-material")
    
    -- Custom highlights
    vim.cmd.hi("Comment gui=italic")
    vim.cmd.hi("Function gui=bold")
    vim.cmd.hi("String gui=none")
    
    -- Make line number background transparent
    vim.cmd.hi("LineNr guibg=NONE")
    
    -- Make cursor line more distinct
    vim.cmd.hi("CursorLine guibg=#32302f")
    
    -- Make the popup menu slightly transparent
    vim.cmd.hi("Pmenu guibg=#3c3836 guifg=#ebdbb2 gui=NONE")
    
    -- Subtle vertical split line
    vim.cmd.hi("VertSplit guifg=#504945 guibg=NONE")
  end,
}