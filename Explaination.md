Install ansible on the teminal

Create a directory for the project mkdir ansible-IP
- 
#### Disable SSH host keys checking

- Create a hosts file with the IP addresses of the client, backend virtual machines on AWS, file is under inventory.ini


#### Provision the servers 
#### Provision the servers

- Create a playbook.yaml that will clone the repo and run the commands that will fire up the application.

#### Create the virtual servers

- Create the TF file that provisions the VMs on AWS and use use debian-cloud/debian-11 as the  boot disk
- Also create ssh-keys locally and save the public key on the project file on AWS VM to allow access. 
- Run terraform init, plan then apply to automatically provision the VMs, and starts the ansbile playbook. Once done, the output will be indicated with the IP that you can access the online app.