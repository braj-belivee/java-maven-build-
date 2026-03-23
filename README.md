# 🚀 CI/CD Pipeline for Java Application with Docker Deployment

## 📌 Project Overview

This project demonstrates a complete **CI/CD pipeline** for a Java-based application using Maven, Docker, and Jenkins.
The pipeline is fully automated — from code commit to deployment — including **auto versioning and container updates**.

---

## 🧩 Architecture Diagram

```id="arch1"
        ┌──────────────┐
        │  Developer   │
        └──────┬───────┘
               │ git push
               ▼
        ┌──────────────┐
        │   GitHub     │
        └──────┬───────┘
               │ webhook trigger
               ▼
        ┌──────────────┐
        │   Jenkins    │
        │ (CI/CD)      │
        └──────┬───────┘
               │
     ┌─────────┴─────────┐
     ▼                   ▼
┌──────────────┐   ┌──────────────┐
│   Maven      │   │   Versioning │
│ (Build JAR)  │   │ (Auto Tag)   │
└──────┬───────┘   └──────┬───────┘
       │                  │
       └────────┬─────────┘
                ▼
        ┌──────────────┐
        │   Docker     │
        │ Build Image  │
        └──────┬───────┘
               │
               ▼
        ┌──────────────┐
        │ Docker Hub   │
        │ (Registry)   │
        └──────┬───────┘
               │
               ▼
        ┌──────────────┐
        │ Deployment   │
        │ (Container)  │
        | (IN Progress)|
        └──────────────┘
```

---

## ⚙️ Technologies Used

```id="techstack"
[ GitHub ] → Source Code Management  
[ Jenkins ] → CI/CD Automation  
[ Maven ] → Build Tool (JAR packaging)  
[ Docker ] → Containerization  
[ Docker Hub ] → Image Registry  
[ Java ] → Application  
```

---

## 🔄 CI/CD Pipeline Flow (Step-by-Step)

```id="pipeline"
1. Code Commit → Developer pushes code to GitHub

2. Trigger → Jenkins pipeline starts via webhook

3. Build Stage → Maven compiles code & generates .jar file

4. Versioning → Automatic version generated (build number / commit ID)

5. Docker Build → Image created using Dockerfile

6. Tagging → Image tagged with generated version

7. Push → Image pushed to Docker Hub

8. Deployment → Latest version pulled and container updated automatically
```

---

## 🏷️ Versioning Strategy

* Automated versioning using:

  * Jenkins build number
  * or Git commit ID
* Each Docker image is uniquely tagged
* Enables easy tracking and rollback

---

## 🐳 Docker Workflow

* Build Docker image from JAR
* Tag image with version
* Push image to Docker Hub
* Pull latest image
* Replace running container

---

## 🔁 Auto Deployment -> (IN Progress)

* Every commit triggers:

  * Build → Version → Image → Deploy
* No manual intervention required
* Ensures continuous delivery

---

## 📦 Project Structure

```id="structure"
.
├── src/
├── pom.xml
├── Dockerfile
├── Jenkinsfile
└── README.md
```

---

## ▶️ How to Run (Manual)

1. Clone the repository
2. Build using Maven:

   ```
   mvn clean package
   ```
3. Build Docker image:

   ```
   docker build -t <image-name> .
   ```
4. Run container:

   ```
   docker run -d -p <port>:<port> <image-name>
   ```

---

## 🚀 Future Improvements

* Add deployment using Ansible
* Implement zero-downtime deployment
* Add monitoring (Prometheus + Grafana)
* Automate rollback

---

## ⭐ Key Highlights

* Fully automated CI/CD pipeline
* Auto versioning of Docker images
* Continuous deployment
* Real-world DevOps workflow

---
