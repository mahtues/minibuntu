hi clear

if exists('syntax on')
    syntax reset
endif

"let g:colors_name = 'disapoinment'

" https://github.com/noahfrederick/vim-hemisu/
function! s:horig(group, style)
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

function! s:h(group, style)
  execute "highlight" a:group
    \ "ctermfg=" (has_key(a:style, "fg") ? a:style.fg  : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg") ? a:style.bg  : "NONE")
    \ "cterm="   (has_key(a:style, "sp") ? a:style.sp  : "NONE")
endfunction

call s:h('Brightest',     {'fg': 255})
call s:h('Bright',        {'fg': 252})
call s:h('Medium',        {'fg': 249})
call s:h('Dark',          {'fg': 246})
call s:h('Darkest',       {'fg': 243})

let s:brightest = {'fg': 255}
let s:bright    = {'fg': 252}
let s:medium    = {'fg': 249}
let s:dark      = {'fg': 246}
let s:darkest   = {'fg': 243}

let s:fgBright = 255
let s:fgNormal = 252
let s:fgDark = 249
let s:fgDarker = 246

let s:red = 181
let s:green = 151
let s:yellow = 187
let s:blue = 146
let s:magenta = 182
let s:cyan = 152
let s:constant = 250
let s:comment = 245
let s:special = 240


call s:h('Normal',        s:brightest)

" syntax highlight
call s:h('Comment',       {'fg': s:darkest.fg, 'sp': 'italic'})

call s:h('Constant',      {'fg': s:red})
hi! link String           Constant
hi! link Character        Constant
hi! link Number           Constant
hi! link Boolean          Constant
hi! link Float            Constant

call s:h('Identifier',    s:medium)
call s:h('Function',      {'sp': 'italic'})

call s:h('Statement',     {'fg': s:fgBright, 'sp': 'none'})
hi! link Conditonal       Statement
hi! link Repeat           Statement
hi! link Label            Statement
hi! link Operator         Statement
hi! link Keyword          Statement
hi! link Exception        Statement

call s:h("PreProc",       {})
hi! link Include          PreProc
hi! link Define           PreProc
hi! link Macro            PreProc
hi! link PreCondit        PreProc

call s:h('Type',          {'fg': s:cyan, 'sp': 'italic'})
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type

call s:h('Special',       {'fg': s:blue})
hi! link SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special

"call s:h("Underlined",    {"fg": s:norm, "gui": "underline", "cterm": "underline"})
"call s:h("Ignore",        {"fg": s:bg})
"call s:h("Error",         {"fg": s:white, "bg": s:red, "cterm": "bold"})
"call s:h("Todo",          {"fg": s:pink, "gui": "underline", "cterm": "underline"})

call s:h('LineNr',        {'fg': 240})
call s:h('SignColumn',    {})
call s:h('MatchParen',    {'fg': 167, 'sp': 'reverse'})

call s:h('StatusLine',    {'fg': 255, 'bg': 237, 'sp': 'bold'})
call s:h('StatusLineNC',  {'fg': 243, 'bg': 237})
call s:h('VertSplit',     {'fg': 237, 'bg':237})
