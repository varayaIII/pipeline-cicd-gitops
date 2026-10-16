# CI/CD + GitOps Pipeline

![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)
![Argo CD](https://img.shields.io/badge/ArgoCD-EF7B4D?style=for-the-badge&logo=argo&logoColor=white)
![Kustomize](https://img.shields.io/badge/Kustomize-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)

A demonstrative **CI/CD and GitOps pipeline** for building, publishing, and deploying a containerized application to Kubernetes.

The project combines GitHub Actions, GitHub Container Registry, Kustomize, and Argo CD to illustrate a declarative delivery workflow.

## Architecture

```text
Git push
   │
   ▼
GitHub Actions ──► Build container ──► Publish image to GHCR
   │
   ▼
Kubernetes manifests managed with Kustomize
   │
   ▼
Argo CD ──► Synchronizes the desired state to the cluster
```

## Features

- Automated container build with GitHub Actions.
- Image publication to GitHub Container Registry (GHCR).
- Declarative Kubernetes resources managed with Kustomize.
- Optional Argo CD synchronization through its API.
- Separate workflows for image build and deployment synchronization.
- A small, reproducible example for learning GitOps practices.

## Repository structure

```text
.
├── manifests/
│   ├── deployment.yaml
│   ├── service.yaml
│   └── kustomization.yaml
├── .github/workflows/
│   ├── build.yml
│   └── sync.yml
├── Dockerfile
├── Makefile
└── README.md
```

## Prerequisites

- Docker.
- A Kubernetes cluster and `kubectl`.
- Kustomize, or a Kubernetes distribution that includes it.
- An Argo CD instance, if synchronization is enabled.
- A GitHub repository with permission to publish packages.

## Quick start

Clone the repository:

```bash
git clone https://github.com/varayaIII/pipeline-cicd-gitops.git
cd pipeline-cicd-gitops
```

Build the image locally:

```bash
docker build -t pipeline-cicd-gitops:local .
```

Validate and render the Kubernetes manifests:

```bash
kubectl kustomize manifests/
```

Apply the manifests directly to a cluster for local testing:

```bash
kubectl apply -k manifests/
kubectl get pods,svc
```

## GitHub Actions configuration

The build workflow uses the automatically provided `GITHUB_TOKEN` to publish the image to GHCR.

If the Argo CD synchronization workflow is enabled, configure this repository secret:

| Secret | Purpose |
|---|---|
| `ARGOCD_TOKEN` | API token for the Argo CD instance |

Store the Argo CD endpoint and application settings according to the variables used by the workflow files.

## GitOps workflow

1. Change the application or Kubernetes manifests.
2. Push the change to the configured branch.
3. GitHub Actions builds and publishes the container image.
4. Argo CD observes the desired state and synchronizes the application.
5. Verify the rollout with `kubectl` or the Argo CD dashboard.

## Useful commands

```bash
kubectl get pods,svc
kubectl describe deployment <deployment-name>
kubectl logs deployment/<deployment-name>
```

## Author

[VarayaIII](https://github.com/varayaIII)
