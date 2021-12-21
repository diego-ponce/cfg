# cfg - bare git repo dotfile management

retrieve the dotfiles
```{bash}
curl https://raw.githubusercontent.com/diego-ponce/code_snippets/main/dotfiles_script | /bin/bash
```
source bashrc
```{bash}
source ~/.bashrc

```

install vim plugins
```{bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
