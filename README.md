
# 🚀 **FastAPI Docker CI/CD Pipeline with GitHub Actions**

## 🌟 Overview
This project demonstrates **Continuous Delivery (CD)** by automating the creation and deployment of a **Dockerized FastAPI application** using **GitHub Actions**.

## 🎯 Features
✅ **FastAPI server** that returns JSON responses  
✅ **Dockerized** using an Ubuntu-based container  
✅ **CI/CD pipeline** with **GitHub Actions** to build & push images to **Docker Hub**  
✅ **Automated Deployment** for seamless integration  
✅ **Scalable & Efficient** workflow  

---

## 📂 Project Structure
```
.
├── main.py                  # FastAPI application
├── requirements.txt         # Dependencies
├── Dockerfile               # Defines how to containerize the application
├── .github/workflows/
│   ├── DockerBuild.yml     # GitHub Actions workflow for CI/CD
├── README.md                # Documentation
```

---

## 📌 Requirements
Ensure you have the following installed before proceeding:
- 🐍 **Python 3.8+**
- 🐳 **Docker**
- 🛠️ **Git**
- 🌐 **GitHub Account** (for Actions & DockerHub integration)

Install dependencies locally:
```sh
pip install -r requirements.txt
```

---

## 🏗️ FastAPI Application (main.py)
```python
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Hello, FastAPI with Docker & GitHub Actions!"}
```

---

## 🐳 Dockerfile (Ubuntu-Based)
```dockerfile
# Use Ubuntu as the base image
FROM ubuntu:latest

# Install Python and dependencies
RUN apt-get update && apt-get install -y python3 python3-pip

# Set working directory
WORKDIR /app

# Copy project files
COPY . /app

# Install dependencies
RUN pip3 install -r requirements.txt

# Expose FastAPI port
EXPOSE 8000

# Run FastAPI server
CMD ["python3", "main.py"]
```

---

## 🔄 GitHub Actions Workflow (CI/CD)
This **GitHub Actions** workflow automates the process of **building and pushing** the Docker image to **Docker Hub**.

```yaml
name: Build and Push Docker Image

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v2
      
      - name: Log in to Docker Hub
        run: echo "${{ secrets.DOCKERTOKEN }}" | docker login -u "${{ secrets.DOCKER_USERNAME }}" --password-stdin

      - name: Build Docker Image
        run: docker build -t docker.io/YOUR_DOCKERHUB_USERNAME/fastapi-app .

      - name: Push Docker Image to Docker Hub
        run: docker push docker.io/YOUR_DOCKERHUB_USERNAME/fastapi-app
```
🔹 **Note:** Ensure you set up **GitHub Secrets** for `DOCKER_USERNAME` and `DOCKERTOKEN`  

---

## 🚀 Deployment Steps

### 1️⃣ **Clone the Repository**
```sh
git clone https://github.com/YOUR_GITHUB_USERNAME/fastapi-docker-ci.git
cd fastapi-docker-ci
```

### 2️⃣ **Build and Run Locally**
```sh
docker build -t fastapi-app .
docker run -p 8000:8000 fastapi-app
```

### 3️⃣ **Push to GitHub**
```sh
git add .
git commit -m "Initial commit"
git push origin main
```

### 4️⃣ **Verify CI/CD Workflow**
✅ Check **GitHub Actions** for workflow status  
✅ Go to **Docker Hub** to confirm the pushed image  

### 5️⃣ **Run the Container from Docker Hub**
```sh
docker pull YOUR_DOCKERHUB_USERNAME/fastapi-app
docker run -p 8000:8000 YOUR_DOCKERHUB_USERNAME/fastapi-app
```

---



## 📎 Project Links
- [Repository URL](https://github.com/divyanshsaxena002/fastapi-docker-ci)
- [Docker Hub URL](https://hub.docker.com/repositories/divyansh002)

---

## 🎯 Conclusion
This project demonstrates a **fully automated CI/CD pipeline** for deploying a **FastAPI app using Docker and GitHub Actions**.  
With **zero manual intervention**, this ensures smooth, scalable, and efficient deployment workflows. 🚀🔥  

---

By: Divyansh Saxena
