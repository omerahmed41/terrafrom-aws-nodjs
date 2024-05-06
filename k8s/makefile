get_pods:
	kubectl get pods --show-labels

kubectl_logs:
	kubectl logs <name>

kubectl_describe:
	 kubectl describe pod <name?

scale_down:
	kubectl scale deployment energy-app-deployment --replicas=0

eks:
	#aws eks --region us-west-2 update-kubeconfig --name my-eks-cluster
	aws eks --region $(terraform output -raw region) update-kubeconfig  --name $(terraform output -raw cluster_name)

apply:
	kubectl apply -f energy-app-deployment.yaml