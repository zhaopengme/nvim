#!/bin/sh

echo "Installing Xcode tools.."
xcode-select --install

echo "Installing Brew.."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle install

echo "Starting Yabai and Skhd services.."
brew services start yabai
brew services start skhd

echo "Installing Oh-My-Zsh.."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

source ~/.zshrc

echo "Installing Tmux plugin manager.."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing Tmux plugins.."
~/.tmux/plugins/tpm/bin/install_plugins

echo "Installing Übersicht Simple-bar.."
git clone https://github.com/Jean-Tinland/simple-bar $HOME/Library/Application\ Support/Übersicht/widgets/simple-bar

echo "Installing GO dependencies.."
go install github.com/go-delve/delve/cmd/dlv@latest
go install golang.org/x/tools/gopls@latest
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/nametake/golangci-lint-langserver@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.45.2

echo "Installing Node.js dependencies.."
nvm install --lts
npm install -g typescript typescript-language-server vscode-langservers-extracted @tailwindcss/language-server

echo "Creating Neovim undodir and dap folders.."
mkdir ~/.config/nvim/undodir
mkdir ~/.config/nvim/dap

echo "Installing vscode GO debug adapter.."
git clone https://github.com/golang/vscode-go ~/.config/nvim/dap/vscode-go
(cd ~/.config/nvim/dap/vscode-go && npm install && npm run compile)

echo "Installing vscode Node.js debug adapter.."
git clone https://github.com/microsoft/vscode-node-debug2.git ~/.config/nvim/dap/vscode-node-debug2
(cd ~/.config/nvim/dap/vscode-node-debug2 && npm install && npm run build)


echo "Installing JDTLS.."
git clone https://github.com/eclipse/eclipse.jdt.ls ~/.config/nvim/lsp/jdtls
(cd ~/.config/nvim/lsp/jdtls && ./mvnw clean install -DskipTests)

echo "Making java_lsp.sh executable.."
chmod 755 ~/.config/nvim/lsp/jdtls/java_lsp.sh

echo "Installing Java debugger.."
git clone https://github.com/microsoft/java-debug ~/.config/nvim/lsp/jdtls/java-debug
(cd ~/.config/nvim/lsp/jdtls/java-debug && ./mvnw clean install)

echo "Installing Java test runner.."
git clone https://github.com/microsoft/vscode-java-test ~/.config/nvim/lsp/jdtls/vscode-java-test
(cd ~/.config/nvim/lsp/jdtls/vscode-java-test && npm install && npm run build-plugin)

echo "Downloading Java decompiler jars.."
git clone https://github.com/dgileadi/vscode-java-decompiler ~/.config/nvim/lsp/jdtls/vscode-java-decompiler

echo "Downloading Lombok jar.."
curl -L https://projectlombok.org/downloads/lombok.jar \
    --output ~/.config/nvim/lsp/jdtls/lombok/lombok.jar \
    --create-dirs

echo "Downloading Google Java Format jar.."
curl -L https://github.com/google/google-java-format/releases/download/v1.15.0/google-java-format-1.15.0-all-deps.jar \
    --output ~/.config/nvim/lsp/jdtls/format/google-java-format.jar \
    --create-dirs
