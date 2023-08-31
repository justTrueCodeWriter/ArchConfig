syntax match TodoWord /TODO/ nextgroup=DoneWord
syntax match DoneWord /DONE/

highlight TodoWord guifg=red
highlight DoneWord guifg=green

let b:current_syntax = 'org'
