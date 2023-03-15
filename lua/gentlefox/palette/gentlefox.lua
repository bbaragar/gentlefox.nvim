local C = require("gentlefox.lib.color")
local Shade = require("gentlefox.lib.shade")

local meta = {
  name = "gentlefox",
  light = false,
}


local bg = C("##191919")
local fg = C("##cccccc")

local palettes = {
  black   = Shade.new("#222222", "#333333", "#000000"),
  red     = Shade.new("#9a383a", "#990000", "#863132"),
  green   = Shade.new("#5dff9e", "#00ff00", "#4cd169"), 
  yellow  = Shade.new("#aaa400", "#b8bb00", "#6f6f2f"),
  blue    = Shade.new("#4cbbd1", "#4CD1A4", "#541691"),
  magenta = Shade.new("#6e33ce", "#cc66cc", "#6e4287"),
  cyan    = Shade.new("#33B1FF", "#65e2ee", "#66cccc"),
  white   = Shade.new("#bbbbbb", "#ffffff", "#555555"),
  orange  = Shade.new("#ef9918", "#ee8606", "#ddaa66"),
  pink    = Shade.new("#cf7dff", "#b275de", "#cc66cc"),

  comment = C("#666666"):to_css(),

  bg0     = C("#333333"):to_css(), -- Dark bg (status line and float)
  bg1     = bg:to_css(), -- Default bg
  bg2     = bg:brighten(6):to_css(), -- Lighter bg (colorcolm folds)
  bg3     = C("#222222"):to_css(), -- Lighter bg (cursor line)
  bg4     = C("#0f291a"):to_css(), -- Conceal, border fg

  fg0     = fg:brighten(6):to_css(), -- Lighter fg
  fg1     = fg:to_css(), -- Default fg
  fg2     = C("#999999"):to_css(), -- Darker fg (status line)
  fg3     = C("#bbbbbb"):to_css(), -- Darker fg (line numbers, fold colums)

  sel0    = "#dfff00", -- Popup bg, visual selection bg
  sel1    = "#00005f", -- Popup sel bg, search bg
}


local function generate_spec(pal)
  -- stylua: ignore start
  local spec = {
    bg0  = pal.bg0,  -- Dark bg (status line and float)
    bg1  = pal.bg1,  -- Default bg
    bg2  = pal.bg2,  -- Lighter bg (colorcolm folds)
    bg3  = pal.bg3,  -- Lighter bg (cursor line)
    bg4  = pal.bg4,  -- Conceal, border fg

    fg0  = pal.fg0,  -- Lighter fg
    fg1  = pal.fg1,  -- Default fg
    fg2  = pal.fg2,  -- Darker fg (status line)
    fg3  = pal.fg3,  -- Darker fg (line numbers, fold colums)

    sel0 = pal.sel0, -- Popup bg, visual selection bg
    sel1 = pal.sel1, -- Popup sel bg, search bg
  }

  spec.syntax = {
    bracket     = spec.fg1,           -- Brackets and Punctuation
    builtin0    = pal.red.base,       -- Builtin variable
    builtin1    = pal.yellow.bright,      -- Builtin type
    builtin2    = pal.orange.base,  -- Builtin const
    builtin3    = pal.red.bright,     -- Not used
    comment     = pal.comment,        -- Comment
    conditional = pal.green.dim, -- Conditional and loop
    const       = pal.red.base,  -- Constants, imports and booleans
    dep         = spec.fg3,           -- Deprecated
    field       = pal.cyan.dim,      -- Field
    func        = pal.blue.base,      -- Functions and Titles
    ident       = pal.cyan.base,      -- Identifiers
    keyword     = pal.orange.bright,   -- Keywords
    number      = pal.orange.dim,    -- Numbers
    operator    = spec.fg2,           -- Operators
    preproc     = pal.red.base,    -- PreProc
    regex       = pal.cyan.bright,  -- Regex
    statement   = pal.green.dim,   -- Statements
    string      = pal.green.base,     -- Strings
    type        = pal.pink.base,    -- Types
    variable    = pal.blue.bright,     -- Variables
  }

  spec.diag = {
    error = pal.red.bright,
    warn  = pal.sel0,
    info  = pal.blue.base,
    hint  = pal.pink.bright,
  }

  spec.diag_bg = {
    error = C(spec.bg1):blend(C(spec.diag.error), 0.15):to_css(),
    warn  = C(spec.bg1):blend(C(spec.diag.warn), 0.15):to_css(),
    info  = C(spec.bg1):blend(C(spec.diag.info), 0.15):to_css(),
    hint  = C(spec.bg1):blend(C(spec.diag.hint), 0.15):to_css(),
  }

  spec.diff = {
    add    = C(spec.bg1):blend(C(pal.green.dim), 0.15):to_css(),
    delete = C(spec.bg1):blend(C(pal.red.dim), 0.15):to_css(),
    change = C(spec.bg1):blend(C(pal.blue.dim), 0.15):to_css(),
    text   = C(spec.bg1):blend(C(pal.cyan.dim), 0.3):to_css(),
  }

  spec.git = {
    add      = pal.green.base,
    removed  = pal.red.base,
    changed  = pal.yellow.base,
    conflict = pal.orange.base,
    ignored  = pal.comment,
  }

  -- stylua: ignore stop

  return spec
end

return { meta = meta, palette = palette, generate_spec = generate_spec }
