command! -nargs=+ ORG exe "normal A " . substitute(system('date "+<%Y-%m-%d %a>" --date="'.<q-args>.'"'), '\n', '', 'g')

command PI :r!~/.config/nvim/scripts/save-image-from-clip ~/.symlinks/knowledge_vault/IMG/
command PIH exe "normal i" . substitute(system('~/.config/nvim/scripts/save-image-from-clip'), '\n', '', 'g')

"command SSC !terminal ~/.config/nvim/scripts/orgview SSC '%:p'
command! -nargs=0 SSC terminal ~/.config/nvim/scripts/orgview SSC '%:p'
"command SDD !terminal ~/.config/nvim/scripts/orgview SDD '%:p'
command! -nargs=0 SDD terminal ~/.config/nvim/scripts/orgview SDD '%:p'

command! -nargs=0 CAL terminal ~/.config/nvim/scripts/orgcal '%:p'

command! -nargs=0 COM terminal ~/.config/nvim/scripts/progress_percentage '%:p'
