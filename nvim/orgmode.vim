command -nargs=+ ORG :r!date "+<\%Y-\%m-\%d \%a>" --date="<args>"

command PI :r!~/.config/nvim/scripts/save-image-from-clip ~/.symlinks/knowledge_vault/IMG/
command PIH :r!~/.config/nvim/scripts/save-image-from-clip 

"command SSC !terminal ~/.config/nvim/scripts/orgview SSC '%:p'
command! -nargs=0 SSC terminal ~/.config/nvim/scripts/orgview SSC '%:p'
"command SDD !terminal ~/.config/nvim/scripts/orgview SDD '%:p'
command! -nargs=0 SDD terminal ~/.config/nvim/scripts/orgview SDD '%:p'

command! -nargs=0 CAL terminal ~/.config/nvim/scripts/orgcal '%:p'

command! -nargs=0 COM terminal ~/.config/nvim/scripts/progress_percentage '%:p'
