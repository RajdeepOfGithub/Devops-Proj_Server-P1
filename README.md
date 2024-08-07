# A Complete Real-time Deployment on Kubernetes Cluster Using Jenkins CI/CD

This project demonstrates a real-time deployment workflow on a Kubernetes cluster utilizing Jenkins CI/CD pipeline. The CI/CD pipeline integrates several tools such as Webhook, Jenkins, Ansible, DockerHub, and a Kubernetes cluster to automate the deployment processes.

## Overview

The project is structured around three main EC2 instances each serving a distinct role in the CI/CD pipeline:

1. **Jenkins Server**: Manages the automation of deploying updates and new versions of the application.
2. **Ansible Server**: Handles configuration management tasks and automates the Docker operations.
3. **Webapp Server**: Hosts the Kubernetes cluster that runs the application using Minikube.

## Prerequisites

- AWS account with access to EC2.
- Ubuntu Servers for all instances.
- Basic understanding of Jenkins, Ansible, Docker, and Kubernetes.

## Tools Used

- **Webhook**: Triggers the Jenkins pipeline on source code changes.
- **Jenkins**: Automates the deployment pipeline.
- **Ansible**: Manages configuration and provisioning.
- **DockerHub**: Repository for managing Docker images.
- **Kubernetes Cluster (K8s)**: Runs the containerized applications.

## Setup

### 1. Jenkins Setup

- Launch an EC2 instance with Ubuntu Server.
- Install Jenkins and default JRE:
  ```bash
  sudo apt update
  sudo apt install default-jre
  sudo wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
  sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > \
        /etc/apt/sources.list.d/jenkins.list'
  sudo apt update
  sudo apt install jenkins
  sudo systemctl start jenkins
  ```
### 2. Ansible Setup

Launch another EC2 instance with Ubuntu Server.

- Install Python, Ansible, and Docker:
  ```bash
  sudo apt update
  sudo apt install python3-pip ansible docker.io
  sudo systemctl start docker
  sudo usermod -aG docker $USER
  ```
  
## 3. Kubernetes Setup

### Launch the third EC2 instance
This instance will host the Kubernetes environment using Minikube.

### Install Docker and Minikube
Execute the following commands to install Docker and set up Minikube:
  ```bash
    sudo apt update
    sudo apt install docker.io
    sudo systemctl start docker
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube-linux-amd64 /usr/local/bin/minikube
    minikube start
  ```
## Usage:

To fully utilize this CI/CD pipeline, follow these steps:

### Configure Webhook in Your SCM
- **Purpose**: Automatically trigger Jenkins to start a new build and deployment process upon code commits.
- **Setup**: Configure a webhook in your source code management (SCM) system to notify Jenkins of any changes.

### Set Up a Jenkins Pipeline
- **Purpose**: Automate the process of building, testing, and deploying your applications.
- **Setup**: Configure Jenkins to use a `Jenkinsfile`, which should be included in your project repository. This file defines all the pipeline stages and steps.

### Run Ansible Playbooks
- **Purpose**: Manage configuration changes and automate Docker tasks to ensure your environment aligns with your application's requirements.
- **Action**: Regularly execute Ansible playbooks to maintain and update system configurations and Docker deployments.

### Monitor Kubernetes
- **Tools**: Use the Kubernetes dashboard or command-line tools like `kubectl`.
- **Purpose**: Essential for managing and monitoring the health and performance of the deployed application.

## Troubleshooting

Proactively address issues in the deployment pipeline:

### Check Service Status
- **Action**: Use `systemctl status` to ensure services like Jenkins, Docker, and Minikube are running properly.
- **Frequency**: Perform this check regularly or whenever you notice issues.

### Network Settings
- **Check**: Ensure there are no connectivity issues between services.
- **Action**: Verify that all required ports are open and accessible across the network configurations.

## Contributing

Your contributions can help enhance this project. Here’s how you can contribute:

### Fork the Repository
- **Action**: Create a copy of this project in your GitHub account by forking it.

### Create a Feature Branch
- **Naming**: Name your branch after the feature or fix you are implementing.
- **Purpose**: Isolate development work without affecting other branches in the repository.

### Submit a Pull Request
- **Action**: Push your branch and changes to your fork and then open a Pull Request against this repository.
- **Purpose**: Allows the project maintainers to review your contributions and integrate them into the official project.

I would really appreciate your efforts to improve this project and encourage you to participate in making enhancements:)

