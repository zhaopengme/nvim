#!/bin/sh

echo "Installing JDTLS.."
git clone https://github.com/eclipse/eclipse.jdt.ls ~/.cache/nvim/lsp/jdtls
(cd ~/.cache/nvim/lsp/jdtls && ./mvnw clean install -DskipTests)

echo "Making java_lsp.sh executable.."
chmod 755 ~/.cache/nvim/lsp/jdtls/java_lsp.sh

echo "Installing Java debugger.."
git clone https://github.com/microsoft/java-debug ~/.cache/nvim/lsp/jdtls/java-debug
(cd ~/.cache/nvim/lsp/jdtls/java-debug && ./mvnw clean install)

echo "Installing Java test runner.."
git clone https://github.com/microsoft/vscode-java-test ~/.cache/nvim/lsp/jdtls/vscode-java-test
(cd ~/.cache/nvim/lsp/jdtls/vscode-java-test && npm install && npm run build-plugin)

echo "Downloading Java decompiler jars.."
git clone https://github.com/dgileadi/vscode-java-decompiler ~/.cache/nvim/lsp/jdtls/vscode-java-decompiler

echo "Downloading Lombok jar.."
curl -L https://projectlombok.org/downloads/lombok.jar \
    --output ~/.cache/nvim/lsp/jdtls/lombok/lombok.jar \
    --create-dirs

echo "Downloading Google Java Format jar.."
curl -L https://github.com/google/google-java-format/releases/download/v1.15.0/google-java-format-1.15.0-all-deps.jar \
    --output ~/.cache/nvim/lsp/jdtls/format/google-java-format.jar \
    --create-dirs
