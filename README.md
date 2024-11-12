# dotfiles
My dotfiles. Helix and more

* [Helix](.config/helix/config.toml)

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
npm i -g vscode-langservers-extracted
```

Install TypeScript language server

```bash
npm install -g typescript typescript-language-server
```

Install TailwindCSS & Svelte

```bash
npm i -g @tailwindcss/language-server
npm i -g svelte-language-server
npm i -g typescript-svelte-plugin
```

Install Go

```bash
go install golang.org/x/tools/gopls@latest
go install github.com/nametake/golangci-lint-langserver@latest
```
