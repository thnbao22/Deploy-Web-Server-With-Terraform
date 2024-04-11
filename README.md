# Deploy-Web-Server-With-Terraform

## Demo Project

First, you need to create an access/ secret key on AWS Management Console for this project and after you complete this project, you must delete you access key immediately

- Clone this project
```
git clone https://github.com/thnbao22/Deploy-Web-Server-With-Terraform.git
```

- After you clone this project, please open the project and run the command in Visual Studio Code
```
terraform init
```
- Remmember to cd to folder terraform :v

![ConnectPrivate](images/14.png)



- After run the command **terrform init** successfully, you can run the following command
```
terraform plan
```

![ConnectPrivate](images/1.png)

- You will see some things happen after run the command.

![ConnectPrivate](images/2.png)

- Then you can run the command **terraform apply --auto-approve**
```
terraform apply --auto-approve
```

![ConnectPrivate](images/4.png)

- You will see that your resources is being created.

- VPC:
  
![ConnectPrivate](images/5.png)

- Subnet:

![ConnectPrivate](images/6.png)

- Route Table:

![ConnectPrivate](images/7.png)

- Subnet Associations:

![ConnectPrivate](images/8.png)

- Internet Gateway:

![ConnectPrivate](images/9.png)

- Security Group:

![ConnectPrivate](images/10.png)

- Inbound Rules:

![ConnectPrivate](images/11.png)

- Web server Instance information:

![ConnectPrivate](images/12.png)

- Check the Apache Web server by using public IPv4 address of EC2 instance:

![ConnectPrivate](images/13.png)

- After seeing web server, you can run the command **terraform destroy --auto-approve**
```
terraform destroy --auto-approve
``` 
- And remmember to delete the keypair and access/secret key
