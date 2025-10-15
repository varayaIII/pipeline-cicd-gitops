Pipeline CI/CD + GitOps

Módulo demostrativo de **integración y entrega continua declarativa (CI/CD)** utilizando:
- GitHub Actions para build y push de contenedores
- ArgoCD para despliegue GitOps automatizado
- Kubernetes + Kustomize para configuración declarativa

---

## Características

✅ Build automatizado con GitHub Actions  
✅ Publicación de imagen en GHCR  
✅ Despliegue declarativo con Kustomize  
✅ Integración opcional con ArgoCD vía API  
✅ Configuración modular y reutilizable  

---

## Estructura del proyecto

pipeline-cicd-gitops/
│── manifests/
│ ├── deployment.yaml
│ ├── service.yaml
│ ├── kustomization.yaml
│── .github/workflows/
│ ├── build.yml
│ ├── sync.yml
│── Dockerfile
│── Makefile
│── README.md


---

## 🚀 Uso rápido

1. **Clona el repositorio:**
   ```bash
   git clone https://github.com/varayaIII/pipeline-cicd-gitops.git
   cd pipeline-cicd-gitops

    Edita los manifests en manifests/ si deseas personalizar la app.

    Configura tus Secrets en GitHub:

        GITHUB_TOKEN → generado automáticamente.

        ARGOCD_TOKEN → token API de tu instancia ArgoCD.

    Haz un commit a main:

        GitHub Actions construirá la imagen y la publicará en GHCR.

        ArgoCD detectará los cambios y desplegará automáticamente.


Verifica el despliegue:

kubectl get pods,svc
