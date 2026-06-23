# Web Server Automation using Ansible

## Project Overview

This project automates the configuration and deployment of a Linux web server using Ansible. The solution follows Infrastructure as Code (IaC) principles to reduce manual effort and ensure consistent server configuration.

## Objectives

* Create the application directory on the target server.
* Copy website files from the control node to the target server.
* Install and configure Nginx.
* Deploy a custom Nginx configuration using templates.
* Start and enable the Nginx service.
* Verify that port 80 is active and accessible.
* Automatically restart Nginx when configuration changes occur.

## Features

* Automated Nginx installation
* Website deployment using Ansible
* Custom Nginx configuration with templates
* Service management and validation
* Handler-based automatic Nginx restart
* Jenkins integration for automated deployment
* Dynamic password generation for website authentication
* Terraform integration for AWS infrastructure provisioning

## Project Structure

```text
ansible-nginx-project/
├── inventory/
├── playbooks/
├── roles/
│   └── webserver/
├── terraform/
├── generate_password.sh
├── jenkinsfile
└── ansible.cfg
```

## Technologies Used

* Ansible
* Jenkins
* Terraform
* AWS EC2
* Nginx
* Linux
* Git & GitHub

## Outcome

The project successfully automates web server setup, website deployment, and configuration management while integrating Terraform for infrastructure provisioning and Jenkins for CI/CD automation.
