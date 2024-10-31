# FastAPI Web API for DevOps Practice on Azure

This project demonstrates a DevOps practice API using FastAPI, Docker, Azure Service Bus, and Azure Container Apps. The API provides a simple structure for handling item data, including calculating a tax-inclusive price.

## Features

- FastAPI for creating the API.
- Docker for containerization.
- Azure Service Bus for message handling.
- Azure Container Apps for containerized deployment.

## Prerequisites

- Docker
- Azure CLI
- Azure Service Bus and Azure Container Apps (configured in Azure Portal)

## Project Structure

```
my_api_project/
├── app/
│   ├── main.py
│   ├── requirements.txt
├── Dockerfile
└── README.md
```

## Setup and Installation

### Clone the Repository

```bash
git clone https://github.com/neeldevenshah/fastapi_web_api_azure_container.git
cd fastapi_web_api_azure_container
```

### Install Dependencies

If you are testing locally, you can install dependencies as follows:

```bash
pip install -r app/requirements.txt
```

### Build the Docker Image

```bash
docker build -t my-fastapi-app .
```

### Run the Docker Container Locally

```bash
docker run -d -p 80:80 my-fastapi-app
```

The API will be available at http://localhost:80.

### Using Azure Service Bus

1. Create a Service Bus Namespace in the Azure portal.
2. Create a Queue within the Service Bus to handle messages.
3. Integrate Azure Service Bus with the FastAPI app using the `azure-servicebus` package.

### Deployment to Azure Container Apps

1. Login to Azure:

```bash
az login
```

2. Create a Resource Group:

```bash
az group create --name MyResourceGroup --location eastus
```

3. Create an Azure Container App Environment:

```bash
az containerapp env create --name MyContainerAppEnv --resource-group MyResourceGroup --location eastus
```

4. Push Docker Image to Azure Container Registry:

```bash
az acr create --resource-group MyResourceGroup --name myContainerRegistry --sku Basic
docker tag my-fastapi-app myContainerRegistry.azurecr.io/my-fastapi-app:v1
docker push myContainerRegistry.azurecr.io/my-fastapi-app:v1
```

5. Deploy to Azure Container Apps:

```bash
az containerapp create --name MyFastApiApp --resource-group MyResourceGroup --environment MyContainerAppEnv --image myContainerRegistry.azurecr.io/my-fastapi-app:v1 --target-port 80
```

### API Endpoints

- GET /: Returns a simple "Hello, World" message.
- POST /items/: Accepts item data and calculates the price including tax.

Example JSON body for POST /items/:

```json
{
  "name": "Sample Item",
  "description": "A sample item for testing",
  "price": 10.0,
  "tax": 1.0
}
```

## License

This project is licensed under the MIT License.
