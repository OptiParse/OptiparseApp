
# LedgerLens - Innovate PS-1 - OptiParse
# Server and Deployment

- **Server Framework:** Express
- **Database:** PostgreSQL
- **Containerization:** Dockerized for easy deployment
- **Hosting:** AWS EC2 Free Tier
- **Hosted Server Address:** [http://43.204.96.79/](http://43.204.96.79/)
- **Hosted ML Model Address:** [http://43.204.96.79:8080/](http://43.204.96.79:8080/)

The server successfully handles login and registration processes, but due to time constraints, the fetch and display transactions are currently hardcoded, even though the necessary routes have been established. Meanwhile, our machine learning model is performing effectively.


## Backend API

### 1. Authentication Routes

Authentication routes handle user signup and login. These routes authenticate users via JWT (JSON Web Token).

#### Routes:

- **POST /api/auth/signup**

  - **Description:** Registers a new user.
  - **Expects:** `username`, `email`, and `password` in the request body.
  - **Response:** A success message and the created user details.

- **POST /api/auth/login**

  - **Description:** Logs in an existing user.
  - **Expects:** `email` and `password` in the request body.
  - **Response:** A JWT token and user details.

### 2. Transaction Routes

Transaction routes manage user transactions such as creating and retrieving transactions.

#### Routes:

- **POST /api/transaction/create**

  - **Description:** Creates a new transaction.
  - **Expects:** Transaction details such as `amount`, `description`, `category`, and `date`.
  - **Response:** The created transaction.

- **GET /api/transaction/all**

  - **Description:** Retrieves all transactions for the authenticated user.
  - **Response:** List of all transactions.

- **POST /api/transaction/addCategory**

  - **Description:** Adds a category to a specific transaction.
  - **Expects:** `transactionId` and `categoryId`.
  - **Response:** Updated transaction with the assigned category.

### 3. Category Routes

Category routes manage categories that can be assigned to transactions.

#### Routes:

- **POST /api/category/create**

  - **Description:** Creates a new category.
  - **Expects:** `categoryName` in the request body.
  - **Response:** The created category.

- **GET /api/category/all**

  - **Description:** Retrieves all categories.
  - **Response:** List of categories.

- **GET /api/category/:id**

  - **Description:** Retrieves a specific category by its ID.
  - **Response:** The requested category.

- **PUT /api/category/:id**

  - **Description:** Updates an existing category by its ID.
  - **Expects:** Updated `categoryName` in the request body.
  - **Response:** The updated category.

- **DELETE /api/category/:id**

  - **Description:** Deletes a category by its ID.
  - **Response:** Success message.

## JWT Authentication Middleware

All routes under `/api/transaction` and `/api/category` are protected by JWT authentication. The user must send the token in the Authorization header as `Bearer <token>`.

- **Example:** `Authorization: Bearer <jwt_token>`

## Flutter Secure Storage for Token Management

Flutter Secure Storage securely stores sensitive data like JWT tokens on the device. It ensures that tokens are safely stored after login, retrieved for authentication, and deleted upon logout to prevent unauthorized access.

- **Key Scenarios:**
  - **Store JWT Token:** Secure storage after login/signup for future API calls.
  - **Retrieve JWT Token:** Access token for backend authentication.
  - **Delete Token on Logout:** Remove token to restrict access.

- **Usage Flow:**
  - **Store Data:** Securely save JWT after login.
  - **Retrieve Data:** Access token on app startup or for network calls.
  - **Check Token Expiry:** Verify token validity before API calls.
  - **Delete Data:** Clear token on logout or expiry.

- **Advantages:**
  - Secure, encrypted storage.
  - Higher security than SharedPreferences.

### 2. ObjectBox for Local Storage

ObjectBox is a fast, efficient local NoSQL database optimized for mobile apps, enabling offline capabilities and structured data storage.

- **Common Use Cases:**
  - **Persisting User Data:** Store user details/settings for offline use.
  - **Storing Transactions Locally:** Save financial records for offline access and sync with backend when online.
  - **Offline Capabilities:** Maintain app functionality without an internet connection.

- **Usage Flow:**
  - **Data Modeling:** Define entities like Transaction, Category, User.
  - **Storing Data:** Save data locally, ensuring persistence even offline.
  - **Retrieving Data:** Access stored data as needed.
  - **Updating/Deleting Data:** Efficiently modify records as required.

- **Advantages:**
  - High performance with complex queries.
  - Supports entity relationships for organized data.

## Combined Workflow: Secure Storage and ObjectBox

- **Authentication and Token Storage:**
  - Store JWT tokens securely using Flutter Secure Storage.
  - Use ObjectBox for quick access to user-related data offline.

- **Managing Transactions:**
  - Store transactions locally with associated categories.
  - Sync data with backend when online.

- **User Session and Token Validation:**
  - Check token validity on app launch.
  - Prompt re-login if token expires, clearing it from storage.

- **Syncing Data:**
  - Sync offline data with backend upon reconnecting to the internet.
  - Ensure local changes are preserved offline, providing robust offline support.
# ML Model Documentation

## Overview

This documentation provides an overview of the machine learning model used in our application, which processes images or PDFs of financial documents to extract key information such as dates, merchant names, and total amounts. The final model leverages PaddleOCR with the `gemini-1.5-pro` configuration for optimal performance.

## Table of Contents

- [Introduction](#introduction)
- [Model Architecture](#model-architecture)
- [Approaches Explored](#approaches-explored)
- [Final Model Implementation](#final-model-implementation)
- [Performance Metrics](#performance-metrics)
- [Usage](#usage)
- [References](#references)

## Introduction

The application is designed to automatically extract key information from financial documents. This task involves several steps, including optical character recognition (OCR) and key information extraction (KIE). The final model integrates these components to achieve high accuracy and efficiency.

## Model Architecture

### Final Model

- **OCR Tool:** PaddleOCR with `gemini-1.5-pro`
- **Key Information Extraction:** Integrated with PaddleOCR's KIE capabilities
![ppocrv3_framework](https://hackmd.io/_uploads/BywodDv3A.png)



### Features

- **Image and PDF Support:** Processes both image and PDF formats.
- **Key Information Extraction:** Identifies and extracts semantic entities like dates, merchant names, and amounts.
- **Layout Analysis:** Analyzes the document layout to improve extraction accuracy.

## Other Approaches Explored

### 1. Tesseract for OCR

**Description:**  
Tesseract is an open-source OCR engine developed by Google. It is widely used for converting printed text into machine-readable text.

- **Time Taken:** Moderate
- **Accuracy:** ~85% on standard documents

### 2. LayoutLM for Key Information Extraction

**Description:**  
LayoutLM is a transformer-based model designed specifically for document understanding tasks. It considers both text and layout information to extract key entities.

- **Time Taken:** High
- **Accuracy:** High with fine-tuning

### 3. PaddleOCR with KIE Integration

**Description:**  
PaddleOCR, with its PP-Structure module, offers integrated OCR and key information extraction capabilities. It supports tasks like layout analysis and semantic entity recognition.

- **Time Taken:** High
- **Accuracy:** High with fine-tuning

### 4. DONUT and TrOCR

**Description:**  
Both DONUT and TrOCR are end-to-end models that perform OCR and document understanding tasks simultaneously.

- **Time Taken:** High
- **Accuracy:** High

### 5. Graph Convolutional Networks (GCN)

**Description:**  
GCNs convert documents into graph structures, allowing the model to learn relationships between different elements (e.g., text blocks, tables).

- **Time Taken:** Very High
- **Accuracy:** High

### 6. PaliGemma

**Description:**  
PaliGemma is a vision-language model that combines a vision encoder and a language decoder for multimodal tasks, including document understanding.

- **Time Taken:** High
- **Accuracy:** High with task-specific fine-tuning

## Final Model Implementation

The final model was implemented using PaddleOCR with the `gemini-1.5-pro` configuration. This setup provided the best balance between accuracy and processing speed, leveraging PaddleOCR's advanced features for OCR and KIE.

### Why PaddleOCR?

- **Accuracy:** High accuracy in text detection and recognition with support on hanwritten text.
- **Flexibility:** Supports various document layouts and formats.
- **Integration:** Seamlessly integrates OCR and KIE tasks, enhancing overall performance.


## References

- [PaddleOCR Documentation](https://paddlepaddle.github.io/PaddleOCR/en/ppstructure/overview.html#1-introduction)

---
# AWS Deployment with Docker Documentation

## Architecture Overview

This documentation provides an overview of the deployment architecture for the financial document processing app using AWS and Docker.

### Architecture Components

- **Server:** Runs on port 80 (HTTP) to handle general application requests.
- **ML Model:** Runs on port 8080 for processing images via the machine learning model.
- **Docker:** Both the server and ML model are containerized using Docker.
- **EC2 Instance:** Hosts both Docker containers.

## Components

### EC2 Instance

- **Instance Type:** t2.micro (Free Tier)
- **Security Groups:**
  - **Port 80:** Open for HTTP traffic.
  - **Port 8080:** Open for ML model API access.

### Docker Containers

- **Server Container:**
  - **Port:** 80
  - **Description:** Handles client requests, serves web pages, and interacts with the ML model.
  - **Endpoints:**
    - `/api/auth/signup`
    - `/api/auth/login`
    - `/api/transaction/create`
    - `/api/transaction/all`
    - `/api/category/create`
    - `/api/category/all`

- **ML Model Container:**
  - **Port:** 8080
  - **Description:** Processes images using a machine learning model to extract transaction details.
  - **Endpoint:** `/process` - Accepts image files for processing.

### Testing

- **Server:** Access via [http://43.204.96.79](http://43.204.96.79) to interact with the web application.
- **ML Model:** Test image processing functionality using:

bash curl -X POST http://43.204.96.79:8080/process
-F "file=@/path/to/your/image.jpg"
## Docker Configuration

### Dockerfile for Server

- **Base Image:** Node.js, Python, or any relevant base image.
- **Exposes:** Port 80.
- **Commands:**
  - Copy source code.
  - Install dependencies.
  - Start server.

### Dockerfile for ML Model

- **Base Image:** Python, TensorFlow, or any relevant base image.
- **Exposes:** Port 8080.
- **Commands:**
  - Copy model and dependencies.
  - Install required packages.
  - Start ML service.

### Docker Compose (Optional)

- **Configuration:**
  - Define services for the server and ML model.
  - Map ports (80 and 8080).
  - Set environment variables and volumes.

## Testing the Deployment

- **Server:** Access the server via [http://43.204.96.79](http://43.204.96.79) to interact with the web application.
- **ML Model:** Use the provided curl command to test the image processing functionality at [http://43.204.96.79:8080/process](http://43.204.96.79:8080/process)
