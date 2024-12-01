.PHONY: apply delete

apply:
	kubectl apply -f mongodb-replica-set.yaml

delete:
	kubectl delete -f mongodb-replica-set.yaml
