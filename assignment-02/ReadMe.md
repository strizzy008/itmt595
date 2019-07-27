# Assignment-02 Deliverable

## Part-01

Connect to the three Kubernetes nodes provided to you and configure a 3 node (1 master 2 node) Kubernetes Cluster.    Configure a client system to remotely connect to the cluster (copy .kube/config).

### Deliverable

Create a folder named **Assignment-02** under your itmt-595 folder in your private GitHub repo provided for the class.  Include a working example of your docker-compose.yaml converted into a Kubernetes Manifest(s).  Provide the manifest files, your .kube/config file (so I can connect to your cluster), and a ReadMe.md file with any instructions or assumptions needed to run the project.

In the manifest, specifify make the same functionality from the docker-compose.yaml file in the manifest file.
Include these additional features.

* Add a quota for each container to use .25 of the processor 
* And have a quota of 1 GB of ram per container
* convert docker-compose to a ReplicaSet manifest (reuse from previous step) with nginx having replica value at 3

*All work is due by the end of the semester Saturday July 27th 11:59 pm*

## Submission Notes:

From Email: 
As previously mentioned that due to the containers not being able to stay up as stated in assign 1 it is expected for the containers to fail in the cluster. I wanted to demonstrate the process I followed though for still being able to convert to a yml manifest for K8 which was sucessfull as well as deployment of the pod to the worker machine.

I have Added the quota for each container to use .25 of the processor in each yaml manifest of each container

I have enabled a quota of 1 GB of ram for each container

The yaml for nginx has a field for you to modify the replica set number, currently it is set at '1' - To change it you will need to simply vi the nginx yaml and change the '1' to a '3'.

Kompose:
I have used Kompose for the conversion of the docker-compose.yaml into the manifest necessary to deploy this app as a pod to the cluster.
You can use 'Kompose down' to stop the current pod and use 'Kompose up' to bring up the pod again.

.kube/config
This file is in the root of ../assignment2

###Misses from this assignment:

Container ability to stay alive
2nd Worker Addition to Cluster 
	as for this issue I have found the issue and am following : https://github.com/kubernetes/kubeadm/issues/1310 
	to correct the issue. since I have not tested this I did not want to create new token and lose connection to the working worker while 
	this is submitted. I would rather have 1 working than neither. 


