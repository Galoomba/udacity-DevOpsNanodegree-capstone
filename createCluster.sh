#create cluster 
eksctl create cluster \
    --name capstonecluster \
    --region us-east-1  \
    --nodegroup-name standard-workers \
    --node-type t2.small \
    --nodes 2 \
    --nodes-min 1 \
    --nodes-max 3  
#update kubeconfig
aws eks --region us-east-1 update-kubeconfig --name capstonecluster