# WanderNest - DevOps Automation Project

## Project Overview

WanderNest is a complete DevOps automation project that demonstrates Infrastructure as Code (IaC), Configuration Management, Containerization, Continuous Integration/Continuous Deployment (CI/CD), and Kubernetes deployment on AWS.

The project automates infrastructure provisioning using Terraform, configures the web server using Ansible, builds Docker images, pushes them to Amazon Elastic Container Registry (ECR) using Jenkins, and prepares the application for deployment on Kubernetes.

---

## Architecture

```
Developer
    │
    ▼
GitHub Repository
    │
    ▼
Jenkins Pipeline
    │
    ├── Build Docker Image
    ├── Push Image to Amazon ECR
    ▼
Amazon ECR
    │
    ▼
Kubernetes (EKS)
    │
    ▼
Deployment
    │
    ▼
Pods
    │
    ▼
Service
    │
    ▼
Application Load Balancer (ALB)
    │
    ▼
Users
```

---

## Technologies Used

- AWS EC2
- Amazon ECR
- Terraform
- Ansible
- Docker
- Jenkins
- Kubernetes
- Nginx
- Git & GitHub
- Linux (Ubuntu)

---

## Project Features

- Infrastructure provisioning using Terraform
- Automated server configuration using Ansible
- Docker containerization
- CI/CD pipeline using Jenkins
- Docker image storage in Amazon ECR
- Kubernetes Deployment
- Kubernetes Service
- Kubernetes Ingress
- ConfigMap for application configuration
- Secret for sensitive credentials
- Resource Requests & Limits
- Readiness Probe
- Liveness Probe

---

## Project Structure

```text
ansible-nginx-project/
├── terraform/
├── playbooks/
├── roles/
├── inventory/
├── k8s/
│   ├── namespace.yaml
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── ingress.yaml
│   ├── configmap.yaml
│   └── secret.yaml
├── Dockerfile
├── Jenkinsfile
├── ansible.cfg
├── generate_password.sh
└── README.md
```

---

## CI/CD Workflow

1. Developer pushes code to GitHub.
2. Jenkins pulls the latest source code.
3. Docker image is built.
4. Jenkins authenticates with Amazon ECR.
5. Docker image is pushed to Amazon ECR.
6. Kubernetes pulls the latest image from Amazon ECR.
7. Application is deployed using Kubernetes manifests.

---

## Kubernetes Components

- Namespace
- Deployment
- Service
- Ingress
- ConfigMap
- Secret
- Resource Requests & Limits
- Readiness Probe
- Liveness Probe

---

## Future Enhancements

- Deploy on Amazon EKS
- Configure AWS Application Load Balancer (ALB)
- Automate EKS provisioning using Terraform
- Monitor the application using Prometheus and Grafana

---

## Author

**Vaishnavi Jagtap**

DevOps Engineer | AWS | Terraform | Ansible | Docker | Kubernetes | Jenkins
