if has('nvim')
  let s:p = v:lua.require('gentlefox.util.lightline').generate('terafox')
else
  lua gentlefox_vim = require('gentlefox.util.lightline').dump('terafox')
  let s:palette_str = luaeval('gentlefox_vim')
  let s:p = eval(s:palette_str)
endif
let g:lightline#colorscheme#terafox#palette = lightline#colorscheme#fill(s:p)
