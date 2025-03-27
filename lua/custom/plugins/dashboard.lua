return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local db = require('dashboard')
    local icons = {
      file = '󰈙',
      app = '',
      terminal = '',
      folder = '',
      vim = '',
      stats = '󰄄',
      clock = '',
      search = '',
      star = '󰓎',
      history = '󰋚',
      edit = '',
      notes = '',
      up = '',
      light = '󰌵',
      note = '󰠮',
      warn = '',
      terminal_cmd = '',
    }

    -- Retro synthwave ASCII art header
    local header = {
      '',
      '',
      '   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣴⣦⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ',
      '   ⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣶⣤⡀⠀⠀⠀⠀⠀⠀   ',
      '   ⠀⠀⠀⠀⣠⣾⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⣿⣿⣶⡀⠀⠀⠀⠀   ',
      '   ⠀⠀⠀⣴⣿⣿⠟⠁⠀⠀⠀⣶⣶⣶⣶⡆⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣦⠀⠀⠀   ',
      '   ⠀⠀⣼⣿⣿⠋⠀⠀⠀⠀⠀⠛⠛⢻⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣧⠀⠀   ',
      '   ⠀⢸⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⡇⠀   ',
      '   ⠀⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀   ',
      '   ⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⡟⢹⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⣹⣿⣿⠀   ',
      '   ⠀⣿⣿⣷⠀⠀⠀⠀⠀⠀⣰⣿⣿⠏⠀⠀⢻⣿⣿⡄⠀⠀⠀⠀⠀⠀⣿⣿⡿⠀   ',
      '   ⠀⢸⣿⣿⡆⠀⠀⠀⠀⣴⣿⡿⠃⠀⠀⠀⠈⢿⣿⣷⣤⣤⡆⠀⠀⣰⣿⣿⠇⠀   ',
      '   ⠀⠀⢻⣿⣿⣄⠀⠀⠾⠿⠿⠁⠀⠀⠀⠀⠀⠘⣿⣿⡿⠿⠛⠀⣰⣿⣿⡟⠀⠀   ',
      '   ⠀⠀⠀⠻⣿⣿⣧⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⠏⠀⠀⠀   ',
      '   ⠀⠀⠀⠀⠈⠻⣿⣿⣷⣤⣄⡀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⠟⠁⠀⠀⠀⠀   ',
      '   ⠀⠀⠀⠀⠀⠀⠈⠛⠿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀   ',
      '   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠛⠛⠛⠛⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ',
      '',
      '               S Y N T H W A V E             ',
      '',
      '       [  ' .. os.date("%Y.%m.%d") .. ' | ' .. os.date("%H:%M:%S") .. '  ]       ',
      '',
    }

    -- Gruvbox-inspired color palette
    local gruvbox = {
      bg = "#282828",
      fg = "#ebdbb2",
      yellow = "#d79921",
      cyan = "#689d6a",
      darkblue = "#458588",
      green = "#98971a",
      orange = "#d65d0e",
      violet = "#b16286",
      magenta = "#d3869b",
      blue = "#83a598",
      red = "#cc241d",
    }

    -- Configure dashboard with hyper theme
    db.setup({
      theme = 'hyper',
      config = {
        header = header,
        week_header = {
          enable = true,
          concat = '  |  ',
          append = {'', ''},
        },
        shortcut = {
          {
            desc = ' New File',
            group = 'DashboardShortCutIcon',
            key = 'n',
            icon = icons.file .. ' ',
            action = 'enew',
          },
          {
            desc = ' Find File',
            group = 'DashboardShortCutIcon',
            key = 'f',
            icon = icons.search .. ' ',
            action = 'Telescope find_files',
          },
          {
            desc = ' Find Word',
            group = 'DashboardShortCutIcon',
            key = 'g',
            icon = icons.search .. ' ',
            action = 'Telescope live_grep',
          },
          {
            desc = ' Recent Files',
            group = 'DashboardShortCutIcon',
            key = 'r',
            icon = icons.history .. ' ',
            action = 'Telescope oldfiles',
          },
          {
            desc = ' File Browser',
            group = 'DashboardShortCutIcon',
            key = 'e',
            icon = icons.folder .. ' ',
            action = 'Neotree toggle',
          },
          {
            desc = ' Settings',
            group = 'DashboardShortCutIcon',
            key = 's',
            icon = icons.vim .. ' ',
            action = 'e $MYVIMRC',
          },
          {
            desc = ' Update Plugins',
            group = 'DashboardShortCutIcon',
            key = 'u',
            icon = icons.up .. ' ',
            action = 'Lazy update',
          },
          {
            desc = ' Quit',
            group = 'DashboardShortCutIcon',
            key = 'q',
            icon = ' ',
            action = 'qa',
          },
        },
        packages = { enable = true },
        project = {
          enable = true,
          limit = 8,
          icon = icons.folder .. ' ',
          label = ' Projects',
          action = 'Telescope find_files cwd=',
        },
        mru = {
          enable = true,
          limit = 10,
          icon = icons.history .. ' ',
          label = ' Recent Files',
          cwd_only = false,
        },
        footer = function()
          -- Collection of programming and tech quotes
          local quotes = {
            { quote = "The only way to go fast is to go well.", author = "Robert C. Martin" },
            { quote = "Programming isn't about what you know; it's about what you can figure out.", author = "Chris Pine" },
            { quote = "The computer was born to solve problems that did not exist before.", author = "Bill Gates" },
            { quote = "Simplicity is prerequisite for reliability.", author = "Edsger W. Dijkstra" },
            { quote = "Any fool can write code that a computer can understand. Good programmers write code that humans can understand.", author = "Martin Fowler" },
            { quote = "First, solve the problem. Then, write the code.", author = "John Johnson" },
            { quote = "Code is like humor. When you have to explain it, it's bad.", author = "Cory House" },
            { quote = "Make it work, make it right, make it fast.", author = "Kent Beck" },
            { quote = "Talk is cheap. Show me the code.", author = "Linus Torvalds" },
            { quote = "It's not a bug; it's an undocumented feature.", author = "Anonymous" },
            { quote = "Software is like entropy: It is difficult to grasp, weighs nothing, and obeys the Second Law of Thermodynamics; i.e., it always increases.", author = "Norman Augustine" },
            { quote = "Programming today is a race between software engineers striving to build bigger and better idiot-proof programs, and the universe trying to produce bigger and better idiots. So far, the universe is winning.", author = "Rick Cook" },
            { quote = "If debugging is the process of removing software bugs, then programming must be the process of putting them in.", author = "Edsger W. Dijkstra" },
            { quote = "Most good programmers do programming not because they expect to get paid or get adulation by the public, but because it is fun to program.", author = "Linus Torvalds" },
            { quote = "Always code as if the guy who ends up maintaining your code will be a violent psychopath who knows where you live.", author = "John Woods" },
            { quote = "The best way to predict the future is to implement it.", author = "David Heinemeier Hansson" },
            { quote = "The function of good software is to make the complex appear to be simple.", author = "Grady Booch" },
            { quote = "Experience is the name everyone gives to their mistakes.", author = "Oscar Wilde" },
            { quote = "The most disastrous thing that you can ever learn is your first programming language.", author = "Alan Kay" },
            { quote = "Perfection is achieved not when there is nothing more to add, but rather when there is nothing more to take away.", author = "Antoine de Saint-Exupery" },
            { quote = "The most important property of a program is whether it accomplishes the intention of its user.", author = "C.A.R. Hoare" },
            { quote = "Good design adds value faster than it adds cost.", author = "Thomas C. Gale" },
            { quote = "The purpose of software engineering is to control complexity, not to create it.", author = "Pamela Zave" },
            { quote = "Computer science education cannot make anybody an expert programmer any more than studying brushes and pigment can make somebody an expert painter.", author = "Eric Raymond" },
            { quote = "Debugging is twice as hard as writing the code in the first place. Therefore, if you write the code as cleverly as possible, you are, by definition, not smart enough to debug it.", author = "Brian Kernighan" },
            { quote = "Measuring programming progress by lines of code is like measuring aircraft building progress by weight.", author = "Bill Gates" },
            { quote = "The best code is no code at all.", author = "Jeff Atwood" },
            { quote = "There are only two hard things in Computer Science: cache invalidation and naming things.", author = "Phil Karlton" },
            { quote = "Nine people can't make a baby in a month.", author = "Fred Brooks" },
            { quote = "A primary cause of complexity is that software vendors uncritically adopt almost any feature that users want.", author = "Niklaus Wirth" },
            { quote = "Before software can be reusable it first has to be usable.", author = "Ralph Johnson" },
            { quote = "Beauty is more important in computing than anywhere else in technology because software is so complicated. Beauty is the ultimate defense against complexity.", author = "David Gelernter" },
            { quote = "UNIX is simple. It just takes a genius to understand its simplicity.", author = "Dennis Ritchie" },
            { quote = "The best thing about a boolean is even if you are wrong, you are only off by a bit.", author = "Anonymous" },
          }
          
          -- Use math.random with os.time() seed for true randomness
          math.randomseed(os.time())
          local selected = quotes[math.random(#quotes)]
          
          return {
            '',
            '󰻘  "' .. selected.quote .. '" - ' .. selected.author,
            '',
          }
        end,
      },
      hide = {
        statusline = true,
        tabline = true,
        winbar = true,
      },
    })

    -- Custom highlight colors to match Gruvbox theme with synthwave feel
    vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = gruvbox.magenta })
    vim.api.nvim_set_hl(0, 'DashboardProjectTitle', { fg = gruvbox.yellow })
    vim.api.nvim_set_hl(0, 'DashboardProjectTitleIcon', { fg = gruvbox.orange })
    vim.api.nvim_set_hl(0, 'DashboardProjectIcon', { fg = gruvbox.orange })
    vim.api.nvim_set_hl(0, 'DashboardMruTitle', { fg = gruvbox.yellow })
    vim.api.nvim_set_hl(0, 'DashboardMruIcon', { fg = gruvbox.orange })
    vim.api.nvim_set_hl(0, 'DashboardFiles', { fg = gruvbox.fg })
    vim.api.nvim_set_hl(0, 'DashboardShortCutIcon', { fg = gruvbox.violet })
    vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = gruvbox.blue })
    
    -- Disable dashboard if we're opening a file directly or restoring a session
    local dashboard_group = vim.api.nvim_create_augroup('Dashboard', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      group = dashboard_group,
      pattern = 'dashboard',
      callback = function()
        vim.opt_local.laststatus = 0
        vim.api.nvim_create_autocmd('BufLeave', {
          buffer = 0,
          callback = function()
            vim.opt.laststatus = 3
          end,
        })
      end,
    })
  end,
}