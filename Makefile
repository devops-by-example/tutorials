all: eks-create
eks-create:
	eksctl create cluster -f 009/eksctl-cluster.yaml
eks-delete:
	eksctl delete cluster -f 009/eksctl-cluster.yaml
