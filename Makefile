build:
	docker build -t ghcr.io/varayaIII/pipeline-cicd-gitops:latest .

push:
	docker push ghcr.io/varayaIII/pipeline-cicd-gitops:latest

deploy:
	kubectl apply -k manifests/

sync:
	curl -k -X POST -H "Authorization: Bearer $(ARGOCD_TOKEN)" https://argocd.example.com/api/v1/applications/nginx-app/sync
