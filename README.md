# Neovim Config Files

Deprecated, now using [https://github.com/conjectures/nvim-lua]


## Todo: 
* plugin config files into lua
* change pyls to jedi-ls

## Installation

### Arch
Install `neovim`
Install `python3.6+`
Install `pip`
```
pacman -Sy python-pip
```

Install nerd fonts for `defx` plugin
```
pacman -Sy ttf-hack-nerd
```
Update plugins in neovim `:PlugUpdate`
Update remote plugins in neovim `:UpdateRemotePlugins`


## Python

### Pyenv
If using pyenv, make python virtual environments `neovim2`, `neovim3` for python2 and python3 versions accordingly.
Then inside the environments, install the `pynvim`  packages.

Use the following code to point the python executable to the pyenv environments
```
let g:python_host_prog = '$HOME/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '$HOME/.pyenv/versions/neovim3/bin/python'
```

## LSP

### NPM
Install the `neovim`  package with `npm`.
```
npm i -g neovim
```

Install lsp dependencies with `npm`
```
npm i -g yaml-language-server
npm i -g bash-language-server
npm i -g vscond-html-languageserver-bin
```
## References
* https://github.com/lucax88x/configs


