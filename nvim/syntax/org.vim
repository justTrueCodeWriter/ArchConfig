syntax match TodoWord /TODO/ nextgroup=DoneWord
syntax match DoneWord /DONE/ nextgroup=SchedWord
syntax match SchedWord /SCHEDULED/ nextgroup=DDWord
syntax match DDWord /DEADLINE/ 

highlight TodoWord guifg=red
highlight DoneWord guifg=green
highlight SchedWord guifg=lightgreen
highlight DDWord guifg=lightred

let b:current_syntax = 'org'
