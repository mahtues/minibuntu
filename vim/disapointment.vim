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

function! s:h(grp, style)
  execute "highlight" a:grp
    \ "ctermfg=" (has_key(a:style, "fg") ? a:style.fg  : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg") ? a:style.bg  : "NONE")
    \ "cterm="   (has_key(a:style, "sp") ? a:style.sp  : "NONE")
endfunction

function! s:l(src, dst)
    execute "hi! link" a:src a:dst
endfunction

function! s:c(grp)
    execute 'hi clear' a:grp
endfunction

let s:perm43 = {'blk': 145, 'red': 181, 'grn': 151, 'ylw': 187, 'blu': 146, 'mgn': 182, 'cya': 152, 'wht': 188}
let s:perm40 = {'blk': 59, 'red': 203, 'grn': 83, 'ylw': 227, 'blu': 63, 'mgn': 207, 'cya': 87, 'wht': 231}
let s:perm50 = {'blk': 16, 'red': 196, 'grn': 46, 'ylw': 226, 'blu': 21, 'mgn': 201, 'cya': 51, 'wht': 231}

let s:theme = s:perm43
let s:full  = s:perm40

let s:black    = 16
let s:white    = 231

let s:gray = [16, 59, 102, 145, 188, 231]

let s:fg = {'full': 255, 'norm': 250, 'dull': 245, 'duller': 240}
let s:bg = {'norm': 'none', 'actv': 239, 'inactv': 237}

call s:h('Normal',        {'fg': s:fg.norm})

" syntax highlight -----------------------------------------------------------

call s:h('Comment',       {'fg': s:fg.dull, 'sp': 'italic'})

call s:h('Constant',      {'fg': s:theme.red})
hi! link String           Constant
hi! link Character        Constant
hi! link Number           Constant
hi! link Boolean          Constant
hi! link Float            Constant

call s:h('Identifier',    {})
hi! link Function         Identifier

call s:h('Statement',     {'fg': s:fg.full})
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

call s:h('Type',          {'fg': s:theme.cya, 'sp': 'italic'})
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type

call s:h('Special',       {'fg': s:theme.blu})
hi! link SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special

" general highlihgt ----------------------------------------------------------

call s:h('Underlined',    {'sp': 'underline'})

call s:h('Ignore',        {'fg': s:black, 'bg': s:full.grn, 'sp': 'bold'})
hi! link DiffAdd          Ignore

call s:h('Error',         {'fg': s:black, 'bg': s:full.red, 'sp': 'bold'})
hi! link ErrorMsg         Error
hi! link DiffDelete       Error
hi! link SpellBad         Error

call s:h('Todo',          {'fg': s:black, 'bg': s:full.ylw, 'sp': 'bold'})
hi! link  DiffText        Todo

call s:h('LineNr',        {'fg': s:fg.duller})

call s:h('Search',        {'fg': s:black, 'bg': s:theme.ylw, 'sp': 'bold,italic'})

call s:h('Visual',        {'sp': 'reverse'})

call s:h('MatchParen',    {'fg': 167, 'sp': 'reverse'})

call s:h('StatusLine',    {'fg': 255, 'bg': 237, 'sp': 'bold'})
call s:h('StatusLineNC',  {'fg': 243, 'bg': 237})
call s:h('VertSplit',     {'fg': 237, 'bg': 237})

call s:h('Pmenu',         {'fg': s:full.wht, 'bg': s:bg.inactv})
call s:h('PmenuSel',      {'fg': s:full.wht, 'bg': 239, 'sp': 'bold'})
call s:h('PmenuSbar',     {'fg': s:gray[2], 'bg': s:gray[1]})
call s:h('PmenuThumb',    {'fg': s:gray[1], 'bg': s:gray[2]})
call s:h('WildMenu',      {'fg': 0, 'bg': s:theme.ylw})
call s:h('CursorLine',    {'fg': s:white, 'bg': s:bg.actv, 'sp': 'bold'})

call s:h('DiffChange',    {'fg': s:black, 'bg': s:white})
call s:h('SignColumn',    {})

call s:h('Directory',     {'fg': s:black, 'bg': s:theme.cya})

" TODO -----------------------------------------------------------------------

hi SpecialKey             ctermfg=4
hi NonText                ctermfg=4
hi IncSearch              cterm=reverse
hi MoreMsg                ctermfg=2
hi ModeMsg                cterm=bold
hi CursorLineNr           cterm=underline
hi Question               ctermfg=2
hi Title                  ctermfg=5
hi WarningMsg             ctermfg=1
hi Folded                 ctermfg=4 ctermbg=7
hi FoldColumn             ctermfg=4 ctermbg=7
hi Conceal                ctermfg=7 ctermbg=1
hi SpellCap               ctermfg=7 ctermbg=4
hi SpellRare              ctermbg=5
hi SpellLocal             ctermbg=6
hi TabLine                ctermfg=0 ctermbg=7 cterm=bold
hi TabLineSel             cterm=bold
hi TabLineFill            cterm=reverse
hi CursorColumn           ctermbg=1
hi ColorColumn            ctermbg=1
hi StatusLineTerm         ctermfg=7 ctermbg=2 cterm=bold
hi StatusLineTermNC       ctermfg=7 ctermbg=2 cterm=bold
hi ToolbarLine            ctermbg=7
hi ToolbarButton          ctermfg=7 ctermbg=0 cterm=bold
