return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Define custom gruvbox color palette to match your theme
    local colors = {
      bg = "#282828",
      fg = "#ebdbb2",
      yellow = "#d79921",
      cyan = "#83a598",
      green = "#98971a",
      orange = "#d65d0e",
      violet = "#b16286",
      magenta = "#d3869b",
      blue = "#458588",
      red = "#cc241d",
    }

    -- Custom mode names
    local mode_map = {
      ['NORMAL'] = 'N',
      ['O-PENDING'] = 'O',
      ['INSERT'] = 'I',
      ['VISUAL'] = 'V',
      ['V-BLOCK'] = 'VB',
      ['V-LINE'] = 'VL',
      ['REPLACE'] = 'R',
      ['COMMAND'] = 'C',
      ['S-BLOCK'] = 'SB',
      ['S-LINE'] = 'SL',
      ['SELECT'] = 'S',
      ['TERMINAL'] = 'T',
    }

    -- Custom component for showing current file's relative path
    local filename_component = {
      'filename',
      path = 1, -- relative path
      symbols = {
        modified = " ●",
        readonly = " ",
        unnamed = "[No Name]",
        newfile = "[New]",
      },
    }

    -- Custom component for displaying LSP clients
    local lsp_server_component = {
      function()
        local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
        if #buf_clients == 0 then
          return "No LSP"
        end

        local buf_client_names = {}
        for _, client in pairs(buf_clients) do
          table.insert(buf_client_names, client.name)
        end
        
        return " " .. table.concat(buf_client_names, ", ")
      end,
      icon = " ",
      color = { fg = colors.violet, gui = "bold" }
    }

    -- Custom component showing current working directory
    local cwd_component = {
      function()
        return " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
      end,
      icon = " ",
      color = { fg = colors.orange, gui = "bold" }
    }

    -- Custom component for showing session recording status
    local recording_component = {
      function()
        local recording_register = vim.fn.reg_recording()
        if recording_register ~= "" then
          return "Recording @" .. recording_register
        end
        return ""
      end,
      color = { fg = colors.red, gui = "bold" }
    }

    -- Custom searchcount component
    local search_count_component = {
      function()
        if vim.v.hlsearch == 0 then
          return ""
        end
        
        local result = vim.fn.searchcount({maxcount = 999, timeout = 500})
        if result.total == 0 then
          return ""
        end
        
        return string.format(" %d/%d", result.current, result.total)
      end,
      icon = " ",
      color = { fg = colors.yellow }
    }

    -- Word count component for markdown and text files
    local word_count_component = {
      function()
        if vim.bo.filetype == "markdown" or vim.bo.filetype == "text" then
          return " " .. tostring(vim.fn.wordcount().words)
        end
        return ""
      end,
      icon = "󰈭 ",
      color = { fg = colors.cyan }
    }

    -- Custom tabline component
    local tabline_component = {
      function()
        local tabs = {}
        local n = vim.fn.tabpagenr('$')
        local current = vim.fn.tabpagenr()
        
        for i = 1, n do
          if i == current then
            table.insert(tabs, "%#lualine_a_normal# " .. i .. " %*")
          else
            table.insert(tabs, "%#lualine_b_normal# " .. i .. " %*")
          end
        end
        
        return table.concat(tabs)
      end,
    }

    require("lualine").setup {
      options = {
        theme = "gruvbox-material",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
        disabled_filetypes = {
          statusline = { "dashboard", "alpha" },
          winbar = { "dashboard", "alpha" },
        },
      },
      sections = {
        lualine_a = {
          {
            'mode',
            fmt = function(str)
              return mode_map[str] or str
            end,
          },
          recording_component,
        },
        lualine_b = {
          {
            'branch',
            icon = "",
          },
          {
            'diff',
            symbols = { added = " ", modified = " ", removed = " " },
            colored = true,
          },
        },
        lualine_c = {
          filename_component,
          cwd_component,
          search_count_component,
        },
        lualine_x = {
          word_count_component,
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
          },
          lsp_server_component,
          { 'filetype', icon_only = false },
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {
        lualine_a = { 'buffers' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'tabs' }
      },
      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { {'filename', path = 1} },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { {'filename', path = 1} },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      extensions = { 'neo-tree', 'lazy', 'mason', 'trouble', 'fugitive' },
    }
  end,
}