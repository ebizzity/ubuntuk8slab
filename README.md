# Azure Ubuntu - minikube Lab Environment 

### Deploy Template to Azure
[<img src="https://aka.ms/deploytoazurebutton"/>](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Febizzity%2Fubuntuk8slab%2Fmaster%2Fk8slabdeploy.json)

Click the "Deploy to Azure" button above.  You have 2 options for deployment.  
1. Deploy into a new VNET (Default)
- Fill out the form, Click Purchase.

![New VNET](images/new-vnet.png)

2. Deploy into an existing VNET
- Fill out the form, Ensure Resource Group name for the VNET (existing) is populated, the VNET name is the name of the existing VNET, the subnet name is the name of the subnet where the VM will reside, Click Purchase.

![New VNET](images/existing-vnet.png)

The deployment will run for a few minutes. It is building the VM and downloading and installing all of the packages to support minikube / graphical desktop / RDP.

---

### Login to VM via SSH

Hint - (Bastion is a great solution for this ;) )

Connect to your new VM via your preferred ssh tool.

![SSH Login](images/ssh-login.png)

### Start-up Minikube

`minikube start`

![Miniukube Start-ssh](images/ssh-minikube.png)

`minikube status`

![Miniukube Status-ssh](images/ssh-minikube-status.png)

`kubectl get all --all-namespaces`

![ssh-kubectl](images/ssh-kubectl.png)

---
### Login to VM via RDP - Alternate

Hint - (Bastion is a great solution for this ;) )

![RDP Login](images/rdp-login.png)

- You may see an error message:
![RDP Login](images/desktoperror.png)
- Just click "Delete"

### Start up a terminal

Click Menu in the upper-right corner of the screen, Navigate to "System Tools" and then "MATE Terminal"

![Terminal](images/terminal.png)

### Start minikube

- Run `minikube start`

![minikube1](images/start-minikube.png)

![minikube2](images/minikube-up.png)

### Check minikube status

- Run `minikube status`

![minikube status](images/minikube-status.png)

### Run kubectl and have fun!

- Run `kubectl get all --all-namespaces`

![kubectl](images/kubectl.png)


## Note:
- minikube does not start automatically on reboot of the VM.  Upon login, just open a terminal and run  `minikube start`
