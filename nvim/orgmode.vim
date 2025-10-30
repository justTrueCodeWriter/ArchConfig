command -nargs=+ ORG :r!date "+<\%Y-\%m-\%d \%a>" --date="<args>"

command PI :r!~/.config/nvim/scripts/save-image-from-clip ~/.symlinks/knowledge_vault/IMG/
command PIH :r!~/.config/nvim/scripts/save-image-from-clip 

command SSC !~/.config/nvim/scripts/orgview SSC '%:p'
command SDD !~/.config/nvim/scripts/orgview SDD '%:p'
