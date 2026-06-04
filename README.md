# learn-terraform & disksapce issue
How to fix the space issues on the lab AMI ?
Our LAB AMI uses xfs fileSystem

Expanding the disk, is not going to let the fileSystem take it directly. 
How to fix the space issue:

1) On LAB AMI, if you see that you ran out of space, you can expand the disk first ( But stll it won't be showing up on the system )
2) But if still you cannot access it as we are using LVM and you've to deligate that to the needed partion.
3) And the commands varies based on the fileSystem that the system uses, ( ext4, jfs, xfs ) and we use xfs. 
    1) Add the disk ( On UI ) 
    2) Expand the disk : sudo growpart /dev/nvme0n1 4          ( 4 is the partition number ) ; expands the partition
    3) sudo lvextend -l +50%FREE /dev/mapper/RootVG-homeVol ;  ( Extends LVM )
    4) sudo lvextend -l +100%FREE /dev/mapper/RootVG-varVol ; ( Extends LVM )
    5) sudo xfs_growfs  /var ; sudo xfs_growfs  /home ;        ( Expand the fileSystem ) 
    6) df -h
If you're using Jenkins

sudo lvextend -l +50%FREE /dev/mapper/RootVG-homeVol ; sudo lvextend -l +1000%FREE /dev/mapper/RootVG-varVol ; sudo xfs_growfs /var ; sudo xfs_growfs /home

Run this : sudo mount -o remount,size=2G /tmp ( This temporary ), place it in the bash_profile
#......................................

# learn-terraform


What is Terraform ?
    Terraform is one of the famous product from HASHICORP!!!
    Terraform is one of the most famous infrastructure as a code tool which supports 6000+ providers
    There is no near close competition for terraform ( Pulumi/OpenTofu )
    Terraform is cloud agnoistic.
    Terraform is openSource! Means code is open

Hashicorp was acquired by IBM!!!!

    With terraform, infrastucture provisioning can be managed via code and this enables us in doing less to no manual actions.
    With this, we develop the code once & can use it multiple times and this enables consistency across the board !!!!

Terraform has 2 editions:
    1) OpenSource Edition ( Free )
    2) Terraform Enterprise ( Support & Workspaces : Where we can store the state and execution happens on the hashicorp manged infra )

What language terraform uses ?
    HCL : Hashicorp Language ( This is a declarative language ) 

How terraform files look like ?
    Terraform only recognizes the files that has *.tf or *.tfvars or *.auto.tfvars

With terraform CDK, developers can provision infrastructure using the language of their choice:
    https://developer.hashicorp.com/terraform/cdktf

How a terraform resource block looks like?
    resource "ec2_instance"  "that" {

    }

Whenever you use terraform, here are the 4 commands that you'd be using the most:   
    
        $ terraform init  ( This downloads all the needed provider info based on the code that you wrote and also initializes the repo )
        $ terraform plan ( Plan shows what you terraform code is going to do, before you really create something, we run a plan to see what the code does and we update our code based on the plan's output )
        $ terraform apply ( This creates the resources shown on the plan )

        Keep in mind, apply can create / destroy / update the resource and it all depends on what you're doing

        $ terraform destroy ( This 100% destros the infrastructure created by the code )

To run terraform commands, we need to have terraform installed:
```
    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
    sudo yum -y install terraform
```

Do we need to provider provider info all the time?
    Yes, with this only terraform comes to know from where it has to download the plugins mentioned in the code.
    We can also mentioned the provider version to download against.
    If you don't mention the provider version, it downloads the latest

If you write the code with giving the provider info, we would get the below error: 

```
$ terraform init
    Initializing provider plugins found in the configuration...
    - Finding latest version of hashicorp/aws...
    - Installing hashicorp/aws v6.47.0...
    ╷
    │ Error: Failed to install provider
    │
    │ Error while installing hashicorp/aws v6.47.0: write
    │ .terraform/providers/registry.terraform.io/hashicorp/aws/6.47.0/linux_amd64/terraform-provider-aws_v6.47.0_x5: no space left on
    │ device

```...........................................................................

Why we get this error when running plan against aws resources ?
$ terraform plan

Planning failed. Terraform encountered an error while generating this plan.

╷
│ Error: No valid credential sources found
│
│   with provider["registry.terraform.io/hashicorp/aws"],
│   on provider.tf line 2, in provider "aws":
│    2: provider "aws" {
│
│ Please see https://registry.terraform.io/providers/hashicorp/aws
│ for more information about providing credentials.
│
│ Error: failed to refresh cached credentials, no EC2 IMDS role found, operation error ec2imds: GetMetadata, http response error
│ StatusCode: 404, request to EC2 IMDS failed

How terraform comes to know in which aws account does it has to provision the infra? Even it know, how authentication works ?

IAM : By default one service in AWS cannot authenticate with another AWS Service! How can my Ec2 instance authenticate ( without userName/password - accessKey/secretKey ) ? Typically, we create an IAM Role for EC2 Instance and provide the needed roles and attached that role to the aws instance and this is the recommended pattern which is safe, secure and password less.
........
For that role, we give permissions based on the need.

Please create an IAM Role in your account with name b60-admin and assign adminstrator access and assign that role to the ec2-workStation. Once you attach the IAM Role to the workstation, from that worstation, you can authenticate to the aws account without the need of credentials.



What terraform apply can do ?

It can create the resources
It can update the resources 
It can turn off and on the resources
It can destory and recreate the resources

So, what determines that to happen ?

You code and what you mentioned is going to act.

+ : create
- : destroy
-/+ : destroy and create
~ : updating the resource

Outputs play a very very  important role in terraform:

1) They are to display something on the screen
2) Share the information between the modules.

We can supply inputs, in these formats:
1) Declare a variable and define the default value
    variable "test" {
        descrition = "Test Variable"
        default = test
    }

2) Declare an empty variable and supply the value in values file

Terraform by default pikcs the values from terraform.tfvars ( You don't have to explicitly call it, if the name is dev.tfvars, need to call it ) or *.auto.tfvars

    # terraform plan -var-file=xys.tfvars

    Can we supply a variable from a commandLine or overRide it from the commandLine ? terraform plan -var varName=value commandLine variable > than default variable

    Functions In terraform are in-built, means you cannot create them, all you can do is use them
lookup: This is a function to pick values from maps and if the kep for a specifc value in the map it not available, rather doing an error, it outputs a default value and with this we do "exception handling"

List Inputs are highly sequence oridented:
Lists are highly dependent on the order of the input, though they are same, aslight change in the order will make them different. So, we should be careful while using lists. In above code, we are creating 4 EC2 instances with names frontend, catalogue, shipping and payment. If we change the order of the list, then the names of the EC2 instances will also change. Then are in general easy to use and striclty not recommended input.

Always maps or map of maps is the recoemmneded way of passing inpts.

Why terraform apply when run multiple times, it's not creating the infra multiple times ?
Terraform maintains a file called as STATE, which records the infra provisioned by it in that file related to the code you write. Everytime you run the terraform plan, your code is going to be validated with what infra is there now, vs what is mentioned in the code : 1) If that infra is not there, it reocrds and create the infra 2) If someone has manually changed the instance properties on the ui , when you run the apply, it compared against the STATEFILE and finds the discrepency and updates it as per the code

Golden Rule: When we built infra with terraform, no more mnaula changes, 100% of the infra management should be by terraform. If not, terraform changes it and for terraform : source of truth is CODE.

Manual changes are overRiden, whenever you make an apply.

Terraform Managed/Provisioned infrastructued should be 100% managed via code. No Manual Changes.

When you run "terraform apply" , the following stateFile and the backup of that file are created in the root directory of your code.

```
    terraform.tfstate
    terraform.tfstate.backup
```

What will happen, if I / someone deleted them by mistake ? Terraform is going to lost track of what it has created!!!! This is a dangerous action.

Keep state local to the directory is BAD action ? why, in team based environment, keeping STATE in a central approach is the matured thing.

This state can be placed or centralised in multiple ways as terraform supports in Multiple Backend Types.

Storing / Centralisg State file is very important as the entire information tracking of the infra provisioning is a critical thing: ( 3 important aspects of organizing the terraform statefile ) 1) Always STATE File should centralised 2) Encrypted 3) Version Controlled

Types Of Storage: 1) Block Level Storage 2) Object / File / Blob storage ( S3: Simple Secure Storage ) 3) Shared Storage

We will start with v4

AWS Can be accessed : 1) from UI 2) aws cli 3) sdk

Arguments vs Attributes in terraform:
Arguments are inputs to the resource
Attributes are the outputs from the resource which are available after the creation of resource ( ip address, instance id, arn , private ip )


How AMI's are built & released & what is the cadence followed as per the best practices :

RHEL9 ( Base AMI Latest v01  ) ---> Make a EC2 Instance with that base AMI & we patch it, do the needed changes ---> Make an AMI ( rhel9-cis-l1-06032026 )

After a quarter

RHEL9 ( Base AMI Latest v02 ) ---> Make a EC2 Instance with that base AMI & we patch it, do the needed changes ---> Make an AMI ( rhel9-cis-l1-09032026 )

How can we fetch the information from the already existing resources using terraform ?
Datasource :
    Using datasource, we can fetch the information of the available resources and there are available as per the provider documentation


    How terraform complies the code ?

    Terraform don't mind whether the code is in a single file or in multiple files :
When ever run the terraform init, terraform loads the *.tf files in an alphabetical orders and compliles them logically.

Goal: ( MVP: Minimal Viable Product )
Roboshop Infra should up with sg, route53 dns record, ansible-cm should run on the components as a part of the provisioning.
Should also support multi envronment based pattern

NFR:

1) Code should be DRY
2) Re-run of the code should work without any issues.
3) Secrets should not be hardcoded
4) Code should support multi-environment

In terraform, to keep code DRY, we have to develop the CODE using MODULES

> Modules help in writing code once and can be used by multiple teams just by supplying inputs
> With modules, code length is going to increase, sharing of outputs among the resources would be tricky, but that should not stop us 

Root Module vs Child Module: Place where you run the terraform commands Calling Module

Modules: Modules can be in the same repository ( Local Modules ) Modules can be a the different repository ( Remote Modules ) Modules can be provider supplied ( Provider Modules ) [ Less Control Over the features ]


What all "terraform init" can do ?

* Iitializing modules...
    - demo-ec2 in modules
* Initializing provider plugins found in the configuration... ( as per the code )
* Initializing the backend.

How can we initize the backend, if the attributes of the backend are on a specific file ?
 terraform init --backend-config=env/prod/state.tfvars
 
