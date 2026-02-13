# 🌍 Multi-Region EC2 Deployment with Nginx using Terraform

## 📌 Project Overview

This project demonstrates how to provision **EC2 instances in multiple AWS regions** using Terraform and automatically configure a web server (Nginx) using **user_data (cloud-init)**.

The infrastructure is deployed in:

* Mumbai (ap-south-1)
* Virginia (us-east-1)

Each instance runs an Nginx server accessible via its public IP address.

---

## 🧱 Architecture

* Terraform as Infrastructure as Code (IaC)
* Multiple AWS providers with aliases
* EC2 instances in two regions
* Security Groups allowing HTTP traffic
* Automated provisioning using user_data
* Nginx web server installation

---

## ⚙️ Technologies Used

* Terraform
* AWS EC2
* AWS Security Groups
* Cloud-Init (user_data)
* Nginx

---

## 📂 Project Structure

.
├── main.tf
├── security_group.tf
└── README.md

---

## 🚀 Deployment Steps

### 1️⃣ Initialize Terraform

terraform init

### 2️⃣ Validate Configuration

terraform validate

### 3️⃣ Deploy Infrastructure

terraform apply

Type **yes** when prompted.

Terraform will create:

* EC2 instance in Mumbai region
* EC2 instance in Virginia region
* Security groups allowing HTTP access

---

## 🌐 Access the Web Server

After deployment, copy the **Public IP** of the instance from AWS console.

Open in browser:

http://PUBLIC_IP

You should see:

👉 Welcome to nginx

---

## 🔐 Security Group Configuration

Inbound Rules:

* HTTP (80) → 0.0.0.0/0

Outbound Rules:

* All traffic allowed

---

## 🧠 Key Learning Outcomes

* Multi-region deployment using Terraform
* Using provider aliases
* Automating server configuration with user_data
* Understanding cloud-init execution
* Debugging installation issues
* Terraform resource lifecycle management

---

## 🐞 Issue Faced & Resolution

### Problem

Nginx installation failed because apt ran in interactive mode, causing cloud-init to abort.

### Resolution

Forced non-interactive installation:

export DEBIAN_FRONTEND=noninteractive
apt-get install -y nginx

This ensured automated installation without prompts.

---

## 🧹 Destroy Infrastructure (Avoid AWS Charges)

terraform destroy

---

## 👨‍💻 Author

C. Lakshman Hari
Aspiring DevOps & Cloud Engineer

---

## ⭐ Future Enhancements

* Add Terraform outputs for public IP
* Deploy custom web page
* Add Application Load Balancer
* Use Auto Scaling Group
* Implement CI/CD pipeline

---
