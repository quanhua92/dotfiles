# dotfiles
My dotfiles. nvim, Helix and more

* [Helix](.config/helix/config.toml)


## How to use combine scripts

Copy to /usr/bin/
```
sudo cp combine-single.sh /usr/bin
sudo cp combine-repo.sh /usr/bin

sudo chmod +x /usr/bin/combine-single.sh
sudo chmod +x /usr/bin/combine-repo.sh
```

Run `combine-single.sh` in any folder to combine all files in that folder to `combined.txt` (no sub-folders)
```
combine-single.sh
```


Run `combine-repo.sh` in any folder to combine all files in that folder to `combined.txt`. Need patterns but can do subfolders. Make sure you have "" around each patterns
```
combine-repo.sh "*.rs"
combine-repo.sh "*.rs" "*.ts"
```

## Neovim - nvim

```bash
cd /tmp
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
tar -xf nvim-linux-x86_64.tar.gz

sudo rsync -av share/ /usr/local/share/
sudo rsync -av bin/ /usr/local/bin/
sudo rsync -av lib/ /usr/local/lib/

rm -rf ~/.local/state/nvim/
rm -rf ~/.local/share/nvim/
cp -r .config/nvim/ ~/.config/nvim

sudo apt-get install ripgrep
```

Useful commands:
- `:MasonInstallAll`
- `:checkhealth`
- `:h nvui`
- `:h nvui.mason`
- `:h vim.lsp.config`
- `rsync -avP ~/.config/nvim .config`

## Helix

Helix Health Check

```bash
hx --health rust
hx --health html
```

## Language Servers

https://github.com/helix-editor/helix/wiki/Language-Server-Configurations

Install HTML/CSS language servers

```bash
pnpm i -g vscode-langservers-extracted
```

Install TypeScript language server

```bash
pnpm install -g typescript typescript-language-server
```

Install TailwindCSS & Svelte

```bash
pnpm i -g @tailwindcss/language-server
pnpm i -g svelte-language-server
pnpm i -g typescript-svelte-plugin
```

Install Go

```bash
go install golang.org/x/tools/gopls@latest
go install github.com/nametake/golangci-lint-langserver@latest
```
