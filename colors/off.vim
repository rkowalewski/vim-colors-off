" Name:       off.vim
" Version:    0.1
" Maintainer: github.com/pbrisbin
" License:    The MIT License (MIT)
"
" A colorscheme meant to look like a more pleasant version of syntax off.
" Structure and what little color there is is taken from pencil.vim
"
" https://github.com/reedes/vim-colors-pencil
"
"""
hi clear

if exists('syntax on')
    syntax reset
endif

let g:colors_name='off'

let s:actual_black      = { "gui": "#000000", "cterm": "0"   }
let s:black             = { "gui": "#303030", "cterm": "234" }
let s:very_subtle_black = { "gui": "#262626", "cterm": "235" }
let s:subtle_black      = { "gui": "#303030", "cterm": "236" }
" let s:light_black       = { "gui": "#424242", "cterm": "8"   }
let s:light_black       = { "gui": "#5E5E5E", "cterm": "8"   }
let s:lighter_black     = { "gui": "#545454", "cterm": "240" }
let s:medium_gray       = { "gui": "#767676", "cterm": "243" }
let s:light_gray        = { "gui": "#949494", "cterm": "246" }
let s:lighter_gray      = { "gui": "#C6C6C6", "cterm": "251" }
let s:lightest_gray     = { "gui": "#eeeeee", "cterm": "253" }
let s:white             = { "gui": "#e6ffff", "cterm": "15"  }
let s:actual_white      = { "gui": "#FFFFFF", "cterm": "231" }

let s:pink              = { "gui": "#fb007a", "cterm": "9"   }
let s:dark_red          = { "gui": "#C30771", "cterm": "1"   }
let s:light_red         = { "gui": "#E32791", "cterm": "1"   }

let s:orange            = { "gui": "#D75F5F", "cterm": "167" }

let s:darker_blue       = { "gui": "#005F87", "cterm": "18"  }
let s:dark_blue         = { "gui": "#008EC4", "cterm": "4"   }
let s:blue              = { "gui": "#20BBFC", "cterm": "12"  }
let s:light_blue        = { "gui": "#b6d6fd", "cterm": "153" }

let s:dark_cyan         = { "gui": "#20A5BA", "cterm": "6"   }
let s:light_cyan        = { "gui": "#4FB8CC", "cterm": "14"  }

let s:dark_green        = { "gui": "#10A778", "cterm": "2"   }
let s:light_green       = { "gui": "#5FD7A7", "cterm": "10"  }

let s:dark_purple       = { "gui": "#523C79", "cterm": "5"   }
let s:light_purple      = { "gui": "#6855DE", "cterm": "13"  }

let s:light_yellow      = { "gui": "#FFE64D", "cterm": "11"  }
let s:dark_yellow       = { "gui": "#A89C14", "cterm": "3"   }

if &background == "dark"
  let s:bg              = s:black
  let s:bg_subtle       = s:light_black
  let s:bg_very_subtle  = s:subtle_black
  let s:bg_most_subtle  = s:very_subtle_black
  let s:norm            = s:white
  let s:norm_subtle     = s:light_gray
  let s:norm_heavy      = s:actual_white
  let s:purple          = s:light_purple
  let s:cyan            = s:light_cyan
  let s:green           = s:light_green
  let s:red             = s:light_red
  let s:yellow          = s:light_yellow
  let s:visual          = s:norm
else
  let s:bg              = s:actual_white
  let s:bg_subtle       = s:light_gray
  let s:bg_very_subtle  = s:lighter_gray
  let s:bg_most_subtle  = s:lightest_gray
  let s:norm            = s:light_black
  let s:norm_subtle     = s:lighter_black
  let s:norm_heavy      = s:light_black
  let s:purple          = s:dark_purple
  let s:cyan            = s:dark_cyan
  let s:green           = s:dark_green
  let s:red             = s:dark_red
  let s:yellow          = s:dark_yellow
  let s:visual          = s:norm
endif

" https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

call s:h("Normal",        {"bg": s:bg, "fg": s:norm})
call s:h("Cursor",        {"bg": s:blue, "fg": s:norm })
call s:h("Comment",       {"fg": s:bg_subtle})
call s:h("String",        {"fg": s:norm_subtle})

hi! link Constant         Normal
hi! link Character        Constant
hi! link Number           Constant
hi! link Boolean          Constant
hi! link Float            Constant

call s:h("Identifier",    {"fg": s:norm_heavy})
hi! link Function         Identifier

call s:h("Statement",     {"fg": s:norm_heavy, "gui": "bold"})
hi! link Conditonal       Statement
hi! link Repeat           Statement
hi! link Label            Statement
hi! link Operator         Statement
hi! link Keyword          Statement
hi! link Exception        Statement

hi! link PreProc          Normal
hi! link Include          PreProc
hi! link Define           PreProc
hi! link Macro            PreProc
hi! link PreCondit        PreProc

call s:h("Type",          {"fg": s:norm_heavy, "gui": "bold", "cterm": "bold"})
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type

call s:h("Special",       {"fg": s:norm_heavy, "gui": "bold", "cterm": "bold"})
hi! lin SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special

call s:h("Underlined",    {"fg": s:norm, "gui": "underline", "cterm": "underline"})
call s:h("Ignore",        {"fg": s:bg})
call s:h("Error",         {"fg": s:actual_white, "bg": s:red, "cterm": "bold"})
call s:h("Todo",          {"fg": s:norm, "gui": "underline", "cterm": "bold"})
call s:h("SpecialKey",    {"fg": s:light_green})
call s:h("NonText",       {"fg": s:medium_gray})
call s:h("Directory",     {"fg": s:dark_blue})
call s:h("ErrorMsg",      {"fg": s:pink})
call s:h("IncSearch",     {"bg": s:yellow, "fg": s:light_black})
call s:h("Search",        {"bg": s:red, "fg": s:bg})
call s:h("MoreMsg",       {"fg": s:medium_gray, "cterm": "bold", "gui": "bold"})
hi! link ModeMsg MoreMsg
call s:h("LineNr",        {"fg": s:bg_subtle})
call s:h("CursorLineNr",  {"fg": s:norm})
call s:h("Question",      {"fg": s:red})
call s:h("StatusLine",    {"bg": s:bg_very_subtle})
call s:h("StatusLineNC",  {"bg": s:bg_very_subtle, "fg": s:medium_gray})
call s:h("VertSplit",     {"bg": s:norm, "fg": s:bg_very_subtle})
call s:h("Title",         {"fg": s:dark_blue})
call s:h("Visual",        {"bg": s:visual, "fg": s:bg})
call s:h("VisualNOS",     {"bg": s:bg_subtle})
call s:h("WarningMsg",    {"fg": s:red})
call s:h("WildMenu",      {"fg": s:bg, "bg": s:norm})
call s:h("Folded",        {"fg": s:medium_gray})
call s:h("FoldColumn",    {"fg": s:bg_subtle})
call s:h("DiffAdd",       {"fg": s:green})
call s:h("DiffDelete",    {"fg": s:red})
call s:h("DiffChange",    {"fg": s:dark_yellow})
call s:h("DiffText",      {"fg": s:dark_blue})
call s:h("SignColumn",    {"fg": s:light_green})
call s:h("IndentGuidesEven",    {"bg": s:bg_most_subtle})

if has("gui_running")
  call s:h("SpellBad",    {"gui": "underline", "sp": s:red})
  call s:h("SpellCap",    {"gui": "underline", "sp": s:light_green})
  call s:h("SpellRare",   {"gui": "underline", "sp": s:pink})
  call s:h("SpellLocal",  {"gui": "underline", "sp": s:dark_green})
else
  call s:h("SpellBad",    {"cterm": "underline", "fg": s:red})
  call s:h("SpellCap",    {"cterm": "underline", "fg": s:light_green})
  call s:h("SpellRare",   {"cterm": "underline", "fg": s:pink})
  call s:h("SpellLocal",  {"cterm": "underline", "fg": s:dark_green})
endif

call s:h("Pmenu",         {"fg": s:norm, "bg": s:bg})
call s:h("PmenuSel",      {"fg": s:bg, "bg": s:norm})
call s:h("PmenuSbar",     {"fg": s:norm, "bg": s:bg_subtle})
call s:h("PmenuThumb",    {"fg": s:norm, "bg": s:bg_subtle})
call s:h("TabLine",       {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("TabLineSel",    {"fg": s:blue, "bg": s:bg_subtle, "gui": "bold", "cterm": "bold"})
call s:h("TabLineFill",   {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("CursorColumn",  {"bg": s:bg_most_subtle})
call s:h("CursorLine",    {"fg": s:norm, "bg": s:bg_most_subtle})
call s:h("ColorColumn",   {"bg": s:bg_most_subtle})

call s:h("MatchParen",    {"bg": s:bg_subtle, "fg": s:norm})
call s:h("qfLineNr",      {"fg": s:medium_gray})

call s:h("htmlH1",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH2",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH3",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH4",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH5",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH6",        {"bg": s:bg, "fg": s:norm})

hi link clojureRegexp               String

hi link diffRemoved                 DiffDelete
hi link diffAdded                   DiffAdd
hi link diffLine                    Comment
hi link diffIndexLine               Comment
call s:h("gitCommitDiff",           {"fg": s:norm_subtle})
call s:h("diffSubName",             {"fg": s:norm, "gui":"bold","cterm":"bold"})

call s:h("markdownH1",              {"fg": s:norm_heavy, "gui": "bold", "cterm": "bold"})
hi link markdownH2                  markdownH1
hi link markdownH3                  markdownH1
hi link markdownH4                  markdownH1
hi link markdownHeadingDelimiter    markdownH1
hi link markdownBold                markdownH1
call s:h("markdownItalic",          {"gui": "italic", "cterm": "italic"})
call s:h("markdownCode",            {"fg": s:bg_subtle})
call s:h("markdownCodeDelimiter",   {"fg": s:norm_heavy, "gui": "bold"})
hi link markdownLinkTextDelimiter   markdownCodeDelimiter
hi link markdownLinkDelimiter       markdownCodeDelimiter
call s:h("markdownLinkText",        {"fg": s:norm_heavy, "gui": "underline,bold", "cterm": "underline,bold"})
call s:h("markdownUrl",             {"fg": s:norm_subtle, "gui": "italic", "cterm": "italic"})

" Signify, git-gutter
hi link SignifySignAdd              LineNr
hi link SignifySignDelete           LineNr
hi link SignifySignChange           LineNr
hi link GitGutterAdd                LineNr
hi link GitGutterDelete             LineNr
hi link GitGutterChange             LineNr
hi link GitGutterChangeDelete       LineNr

" help
hi link helpHyperTextJump Underlined
hi link helpExample       String
