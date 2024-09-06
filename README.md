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

Install HTML language servers

```bash
npm i -g vscode-langservers-extracted
```

Install TypeScript language server

```bash
npm install -g typescript typescript-language-server
```

Install Go

```bash
go install golang.org/x/tools/gopls@latest
go install github.com/nametake/golangci-lint-langserver@latest
```
