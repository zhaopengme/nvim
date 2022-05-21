#!/bin/sh

echo "Installing GO dependencies.."
go install github.com/go-delve/delve/cmd/dlv@latest
go install golang.org/x/tools/gopls@latest
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/nametake/golangci-lint-langserver@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.45.2

echo "Installing Node.js dependencies.."
# nvm install --lts
npm install -g typescript typescript-language-server vscode-langservers-extracted @tailwindcss/language-server


echo "Installing vscode GO debug adapter.."
git clone https://github.com/golang/vscode-go ~/.cache/nvim/dap/vscode-go
(cd ~/.cache/nvim/dap/vscode-go && npm install && npm run compile)

echo "Installing vscode Node.js debug adapter.."
git clone https://github.com/microsoft/vscode-node-debug2.git ~/.cache/nvim/dap/vscode-node-debug2
(cd ~/.cache/nvim/dap/vscode-node-debug2 && npm install && npm run build)



