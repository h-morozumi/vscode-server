# VSCode Server with Developer Tools

This project sets up a Visual Studio Code Server. It allows you to run a VS Code environment in a containerized setup, making it easy to develop and test applications in an isolated environment.

I have installed the necessary development tools on VSCode-Server. The installed tools include the following:

- vscode-server  
- Java  
- Python  
- Node.js  
- Azure CLI  
- Docker CLI  

## Project Structure

- **Dockerfile**: Contains instructions to build the Docker image for the VS Code Server.
- **docker-compose.yml**: Defines the services, networks, and volumes for the Docker application.
- **README.md**: Documentation for the project.

## Setup Instructions

1. **Export the Required Environment Variables**:
   ```bash
   export PASSWORD=<password>
   ```

2. **Run the Application**:
   ```bash
   docker compose up
   ```

## Usage Guidelines

- Access the VS Code Server by navigating to `http://localhost:8080` in your web browser.
- You can customize the environment by modifying the `docker-compose.yml` file to add any necessary environment variables or dependencies.
