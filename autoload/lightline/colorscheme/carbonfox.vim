if has('nvim')
  let s:p = v:lua.require('gentlefox.util.lightline').generate('carbonfox')
else
  lua gentlefox_vim = require('gentlefox.util.lightline').dump('carbonfox')
  let s:palette_str = luaeval('gentlefox_vim')
  let s:p = eval(s:palette_str)
endif
let g:lightline#colorscheme#carbonfox#palette = lightline#colorscheme#fill(s:p)
