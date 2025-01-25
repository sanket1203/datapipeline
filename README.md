# datapipeline

Step 1: Install Prerequisites
Install Minikube:

Download Minikube for Windows: Minikube Installation
Install using Chocolatey (if available):
bash
Copy
Edit
choco install minikube
Verify installation:
bash
Copy
Edit
minikube version
Install Kubernetes CLI (kubectl):

Download kubectl: Install kubectl
Install using Chocolatey:
bash
Copy
Edit
choco install kubernetes-cli
Verify installation:
bash
Copy
Edit
kubectl version --client
Install Docker Desktop:

Download Docker Desktop: Docker for Windows
Enable the Kubernetes feature in Docker settings.
Install Kafka CLI Tools (Optional):

Download Kafka binaries: Kafka Downloads
Install Python:

Download Python: Python Downloads
Install Kafka Python libraries:
bash
Copy
Edit
pip install kafka-python
Step 2: Start Minikube
Start Minikube:

bash
Copy
Edit
minikube start --driver=docker
Enable ingress:

bash
Copy
Edit
minikube addons enable ingress
Verify Minikube is running:

bash
Copy
Edit
minikube status
Step 3: Deploy Kafka on Minikube
Install Helm:

Download Helm: Helm Installation
Install using Chocolatey:
bash
Copy
Edit
choco install kubernetes-helm
Verify installation:
bash
Copy
Edit
helm version
Deploy Kafka with Helm:

bash
Copy
Edit
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install kafka bitnami/kafka
Verify Kafka pods:

bash
Copy
Edit
kubectl get pods