FROM codercom/code-server:latest

# Customize VSCode Server
## Install jq
RUN sudo apt-get update && sudo apt-get install -y jq

## Change VSCode Server Settings
RUN jq '. + {"extensionsGallery": {"serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery","cacheUrl": "https://vscode.blob.core.windows.net/gallery/index","itemUrl": "https://marketplace.visualstudio.com/items"}}' /usr/lib/code-server/lib/vscode/product.json > updated_example.json
RUN sudo mv updated_example.json /usr/lib/code-server/lib/vscode/product.json

# Install Java
RUN sudo apt-get install -y openjdk-17-jdk
RUN sudo apt-get install -y maven
RUN sudo apt-get install -y gradle

# Install Python
RUN sudo apt-get install -y python3
RUN sudo apt-get install -y python3-pip
RUN curl -sSL https://install.python-poetry.org | python3 -
RUN echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc

# Install Node.js
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN sudo apt-get update && sudo apt-get install -y nodejs yarn npm

# Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
RUN sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release
RUN sudo mkdir -p /etc/apt/keyrings
RUN curl -sLS https://packages.microsoft.com/keys/microsoft.asc |gpg --dearmor | sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null
RUN sudo chmod go+r /etc/apt/keyrings/microsoft.gpg
RUN AZ_DIST=$(lsb_release -cs) && \
    echo "Types: deb\nURIs: https://packages.microsoft.com/repos/azure-cli/\nSuites: ${AZ_DIST}\nComponents: main\nArchitectures: $(dpkg --print-architecture)\nSigned-by: /etc/apt/keyrings/microsoft.gpg" | sudo tee /etc/apt/sources.list.d/azure-cli.sources
RUN sudo apt-get update && sudo apt-get install -y azure-cli

# Install Docker
RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN sudo sh get-docker.sh
RUN sudo usermod -aG docker coder

# after setup
RUN mkdir /home/coder/project
RUN rm -rf get-docker.sh
