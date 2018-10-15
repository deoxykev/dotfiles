rg "dns" | fzf --preview "echo {} | cut -f1 -d: | xargs cat" | xargs -0 echo | cut -f1 -d: | xargs vim
