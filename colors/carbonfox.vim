lua << EOF
-- Useful when debugging
if vim.g.gentlefox_debug then
  require("gentlefox.util.reload")()
end

require("gentlefox.config").set_fox("carbonfox")
require("gentlefox").load()
EOF
