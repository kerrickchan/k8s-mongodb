# MongoDB Replica Set Deployment in Kubernetes

This guide explains the deployment of a **MongoDB Replica Set** in Kubernetes using a **StatefulSet**, **headless service**, and **Persistent Volume Claims (PVCs)**.

## Table of Contents

- [Overview](#overview)
- [Components](#components)
- [YAML Specification](#yaml-specification)
- [How It Works](#how-it-works)
- [Key Benefits](#key-benefits)

---

## Overview

This setup deploys a **3-node MongoDB Replica Set** in Kubernetes using the following components:
- **StatefulSet** for managing MongoDB pods.
- **Headless Service** for stable DNS names for inter-pod communication.
- **Persistent Volumes** for data durability.

### Replica Set Members
- **Primary Node**: Handles all reads and writes.
- **Secondary Nodes**: Replicate data from the primary.
- **DNS Names**:
  - `mongodb-0.mongodb-headless-service`
  - `mongodb-1.mongodb-headless-service`
  - `mongodb-2.mongodb-headless-service`

---

## Components

### 1. ServiceAccount
A **ServiceAccount** for secure inter-pod communication.

### 2. Headless Service
Used for stable DNS records for MongoDB pods.

### 3. StatefulSet
Manages the MongoDB pods, ensuring:
- Stable pod names.
- Persistent storage for each pod.
- Ordered pod creation and deletion.

### 4. Persistent Volumes
Ensures that each pod has dedicated storage for MongoDB data, which persists across pod restarts.

---

## YAML Specification

### ServiceAccount
```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: mongodb-sa
