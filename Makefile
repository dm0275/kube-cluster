USERNAME=ubuntu

.PHONY: help
.DEFAULT_GOAL := help

fetch-dependencies: ## Fetch dependencies
	mr bootstrap .mrconfig .

deploy-cluster: ## Deploy the Kubernetes cluster via the Ansible playbook
	ansible-playbook -i hosts -e "username=$(USERNAME)" kubecluster.yml

clean: ## Clean directory
	rm -rf kube-cluster-ansible join_cmd

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'