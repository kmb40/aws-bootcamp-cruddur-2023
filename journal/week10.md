# Week 10—11 - CloudFormation Part 1&2

The following information outlines tasks that I've completed for Week 10 of the bootcamp. 

The objective is to create and deploy a CloudFormation (CFN) Template for our cluster and load balancer.

### 1. [Attended - Live Stream](https://www.youtube.com/watch?v=BRmEG4zicM0)  
### 2. [Watched Week 10-11 CFN for Networking layer](https://www.youtube.com/watch?v=jPdm0uLyFLM)
### 3. [Watched Week 10-11 Diagramming the Networking layer](https://www.youtube.com/watch?v=lb3aKVVMn7U)
### 4. [Watched Week 10-11 CFN Cluster layer](https://www.youtube.com/watch?v=sdqWoOaeD2M)
### 5. [Watched Week 10-11 CFN Toml Part 1](https://www.youtube.com/watch?v=ATv1Z-T0LKI)
### 6. [Watched Week 10-11 CFN Toml Part 2](https://www.youtube.com/watch?v=cYoNAadSYM8)
### 7. [Watched Week 10-11 CFN Cluster Layer Finish](https://www.youtube.com/watch?v=RITT94dfhOM)
### 8. [Watched Week 10-11 CFN Service Layer](https://www.youtube.com/watch?v=yj8QK8YULCQ)

#### Envrionment Prep
- Created a new Directory at `AWS/CFN`.
- Created a new Directory at `BIN/CFN`.
- Created template file in [`aws/cfn/networking/template.yaml`](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-10/aws/cfn/template.yaml).
- Created deploy file in [`bin/cfn/networking-deploy`](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/400553cb18f17459683e12f014f9416f0de95a3a/bin/cfn/networking-deploy).
- CloudFormation Linter (cfn-lint) is an open-source tool that you can use to perform detailed validation on your AWS CloudFormation templates. Installed using ` pip install cfn-lint`.
-   Added to gitpod.yml using:
```
  - name: cfn
    before: |
      pip install cfn-lint
```

 #### Created an S3 bucket and uploaded a template file using CFN
- Created s3 bucket named `cfn-artifiacts` to hold template file.
- Deployed the code which sent the template file to s3 bucket.

<img src="/assets/cfn-artifacts.png" width=450>
<figcaption>CFN Artifacts S3 Bucket</figcaption>   
<br/><br/>  

#### Updated Network Layer CloudFromation Template
- Updated CloudFormation Template file [`/aws/cfn/networking/template.yaml`](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-10/aws/cfn/networking/template.yaml) as follows:

**Note:** Be sure to use you own region.    

```
AWSTemplateFormatVersion: 2010-09-09

Parameters:
  VpcCidrBlock:
    Type: String
    Default: 10.0.0.0/16
  Az1:
    Type: AWS::EC2::AvailabilityZone::Name
    Default: us-east-1a
  SubnetCidrBlocks: 
    Description: "Comma-delimited list of CIDR blocks for our private public subnets"
    Type: CommaDelimitedList
    Default: >
      10.0.0.0/24, 
      10.0.4.0/24, 
      10.0.8.0/24, 
      10.0.12.0/24,
      10.0.16.0/24,
      10.0.20.0/24
  Az2:
    Type: AWS::EC2::AvailabilityZone::Name
    Default: us-east-1b
  Az3:
    Type: AWS::EC2::AvailabilityZone::Name
    Default: us-east-1c
Resources:
  VPC:
    # https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-vpc.html
    Type: AWS::EC2::VPC
    Properties:
      CidrBlock: !Ref VpcCidrBlock
      EnableDnsHostnames: true
      EnableDnsSupport: true
      InstanceTenancy: default
      Tags:
        - Key: Name
          Value: !Sub "${AWS::StackName}VPC"
  IGW:
    # https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-internetgateway.html
    Type: AWS::EC2::InternetGateway
    Properties:
      Tags:
        - Key: Name
          Value: !Sub "${AWS::StackName}IGW"
  AttachIGW:
    Type: AWS::EC2::VPCGatewayAttachment
    Properties:
      VpcId: !Ref VPC
      InternetGatewayId: !Ref IGW
  RouteTable:
    # https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-routetable.html
    Type: AWS::EC2::RouteTable
    Properties:
      VpcId:  !Ref VPC
      Tags:
        - Key: Name
          Value: !Sub "${AWS::StackName}RT"
  RouteToIGW:
    # https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-route.html
    Type: AWS::EC2::Route
    DependsOn: AttachIGW
    Properties:
      RouteTableId: !Ref RouteTable
      GatewayId: !Ref IGW
      DestinationCidrBlock: 0.0.0.0/0
  SubnetPub1:
    # https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-subnet.html
    Type: AWS::EC2::Subnet
    Properties:
      AvailabilityZone: !Ref Az1
      CidrBlock: !Select [0, !Ref SubnetCidrBlocks]
      EnableDns64: false
      MapPublicIpOnLaunch: true #public subnet
      VpcId: !Ref VPC
      Tags:
        - Key: Name
          Value: !Sub "${AWS::StackName}SubnetPub1"
  SubnetPub2:
    # https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-subnet.html
    Type: AWS::EC2::Subnet
    Properties:
      AvailabilityZone: !Ref Az2
      CidrBlock: !Select [1, !Ref SubnetCidrBlocks]
      EnableDns64: false
      MapPublicIpOnLaunch: true #public subnet
      VpcId: !Ref VPC
      Tags:
        - Key: Name
          Value: !Sub "${AWS::StackName}SubnetPub2"
  SubnetPub3:
    # https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-subnet.html
    Type: AWS::EC2::Subnet
    Properties:
      AvailabilityZone: !Ref Az3
      CidrBlock: !Select [2, !Ref SubnetCidrBlocks]
      EnableDns64: false
      MapPublicIpOnLaunch: true #public subnet
      VpcId: !Ref VPC
      Tags:
        - Key: Name
          Value: !Sub "${AWS::StackName}SubnetPub3"
  SubnetPriv1:
    # https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-subnet.html
    Type: AWS::EC2::Subnet
    Properties:
      AvailabilityZone: !Ref Az1
      CidrBlock: !Select [3, !Ref SubnetCidrBlocks]
      EnableDns64: false
      MapPublicIpOnLaunch: false #public subnet
      VpcId: !Ref VPC
      Tags:
        - Key: Name
          Value: !Sub "${AWS::StackName}SubnetPriv1"
  SubnetPriv2:
    # https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-subnet.html
    Type: AWS::EC2::Subnet
    Properties:
      AvailabilityZone: !Ref Az2
      CidrBlock: !Select [4, !Ref SubnetCidrBlocks]
      EnableDns64: false
      MapPublicIpOnLaunch: false #public subnet
      VpcId: !Ref VPC
      Tags:
        - Key: Name
          Value: !Sub "${AWS::StackName}SubnetPriv2"
  SubnetPriv3:
    # https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-subnet.html
    Type: AWS::EC2::Subnet
    Properties:
      AvailabilityZone: !Ref Az3
      CidrBlock: !Select [5, !Ref SubnetCidrBlocks]
      EnableDns64: false
      MapPublicIpOnLaunch: false #public subnet
      VpcId: !Ref VPC
      Tags:
        - Key: Name
          Value: !Sub "${AWS::StackName}SubnetPriv3"
  SubnetPub1RTAssociation:
    Type: AWS::EC2::SubnetRouteTableAssociation
    Properties:
      SubnetId: !Ref SubnetPub1
      RouteTableId: !Ref RouteTable
  SubnetPub2RTAssociation:
    Type: AWS::EC2::SubnetRouteTableAssociation
    Properties:
      SubnetId: !Ref SubnetPub2
      RouteTableId: !Ref RouteTable
  SubnetPub3RTAssociation:
    Type: AWS::EC2::SubnetRouteTableAssociation
    Properties:
      SubnetId: !Ref SubnetPub3
      RouteTableId: !Ref RouteTable
  SubnetPriv1RTAssociation:
    Type: AWS::EC2::SubnetRouteTableAssociation
    Properties:
      SubnetId: !Ref SubnetPriv1
      RouteTableId: !Ref RouteTable
  SubnetPriv2RTAssociation:
    Type: AWS::EC2::SubnetRouteTableAssociation
    Properties:
      SubnetId: !Ref SubnetPriv2
      RouteTableId: !Ref RouteTable
  SubnetPriv3RTAssociation:
    Type: AWS::EC2::SubnetRouteTableAssociation
    Properties:
      SubnetId: !Ref SubnetPriv3
      RouteTableId: !Ref RouteTable
Outputs:
  VpcId:
    Value: !Ref VPC
    Export:
      Name: VpcId
  VpcCidrBlock:
    Value: !GetAtt VPC.CidrBlock
    Export:
      Name: VpcCidrBlock
  SubnetCidrBlocks:
    Value: !Join [",", !Ref SubnetCidrBlocks]
    Export:
      Name: SubnetCidrBlocks
  SubnetIds:
    Value: !Join 
      - ","
      - - !Ref SubnetPub1
        - !Ref SubnetPub2
        - !Ref SubnetPub3
        - !Ref SubnetPriv1
        - !Ref SubnetPriv2
        - !Ref SubnetPriv3
    Export:
      Name: SubnetIds
  AvailabilityZones:
    Value: !Join 
      - ","
      - - !Ref Az1
        - !Ref Az2
        - !Ref Az3
    Export:
      Name: AvailabilityZones
```
- Deployed the CloudFormation Template using the command `./bin/cfn/networking-deploy`

### Problems Solved
- Encountered a large number of problems in Gitpod labled "Unresolved Tag: !Ref"
<img src="/assets/unresolved tag- !Ref.png" width=450>
<figcaption>Unresolved Tag Errors in Gitpod</figcaption>   
<br/><br/>

- Resolved by adding custom tags to the settings for YAML in Gitpod.   
```
    "yaml.customTags": [
  "!Equals sequence",
  "!FindInMap sequence",
  "!GetAtt",
  "!GetAZs",
  "!ImportValue",
  "!Join sequence",
  "!Ref",
  "!Select sequence",
  "!Split sequence",
  "!Sub"
    ]
```
- If there is existing code in the settings, integrate as follows:
<img src="/assets/gitpod-setting-ref-error-fix.png" width=450>
<figcaption>Custom tag integration with existing code in Gitpod settings</figcaption>   
<br/><br/>  

### CFN Guard to be visited at a later time
- Created `task-definition.guard` at `/aws/cfn/
- Installed `cfn-guard` using `cargo install cfn-guard`
-   Add to gitpod.yml
- Paused cfn-guard implementation to keep focused on CFN

### Diagramming the CloudFormation Network Layer
<img src="/assets/Cruddur%20-%20Diagrams%20-%20CFN.png" width=450>
<figcaption>Custom tag integration with existing code in Gitpod settings</figcaption>   
<br/><br/>  

[Lucid Source Version (Updated versions](https://lucid.app/lucidchart/d6001220-63ae-4bc7-afe6-215c53ae4aba/edit?viewport_loc=-390%2C-18%2C2588%2C1414%2CucYRXwJQHIRK&invitationId=inv_4664376a-d244-4bde-9003-d7d1e637cfd3)

### Deployed the CloudFormation Network Layer
- Deployed the CloudFormation Networking Layer Template using the command `./bin/cfn/networking-deploy`.  
<img src="/assets/CrdNet.png" width=450>
<figcaption>Custom tag integration with existing code in Gitpod settings</figcaption>   
<br/><br/>  

### Setup the CloudFormation Cluster Layer
- Created template file in [`aws/cfn/cluster/template.yaml`](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-10/aws/cfn/cluster/template.yaml).  
- Created deploy file in [`bin/cfn/cluster-deploy`](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-10/bin/cfn/cluster-deploy).  

### Deployed the CloudFormation Cluster Layer

#### Deployed Toml in order to pass parameters to CloudFormation
[Reference Teachers Seat Github Repo](https://github.com/teacherseat/cfn-toml)

cfn-toml reads a toml file - [a file format for configuration files](https://en.wikipedia.org/wiki/TOML#:~:text=TOML%20is%20a%20file%20format,map%20unambiguously%20to%20a%20dictionary.) - that is designed to be used with CloudFormation CLI commands within a bash script.
- Installed cfn-toml using `gem install cfn-toml`
- Added to the gitpod.yml file to automate installation during future workspace startups.
#### Toml for Cluster Layer
- Created a new file `config.toml` at [`aws/cfn/cluster/`](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-10/aws/cfn/cluster/config.toml)   

#### Toml for Network Layer
- Created a new file `config.toml` at [`aws/cfn/networking/`](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-10/aws/cfn/networking/config.toml)   

**Note:** There were a few issues encountered during deployments that were resolved as follows:
- Separated Public and Private Subnets in the networking template at [See lines around 193 `aws/cfn/networking`](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-10/aws/cfn/networking/template.yaml).
- Added code to all security group using `GetAtt` instead of `Ref`. [See around line 103 at `aws/cfn/cluster`](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-10/aws/cfn/cluster/template.yaml)

- Deployed the CloudFormation Networking layer succesfully.
<img src="/assets/CrdNet.png" width=450>
<figcaption>Networking Layer Deployed</figcaption>   
<br/><br/>  

- Deployed the CloudFormation Cluster layer succesfully.  
<img src="/assets/cf-cluster-deploy.png" width=450>
<figcaption>Cluster Layer Deployed</figcaption>   
<br/><br/>  

### Deployed RDS Layer
**NOTE** The database was required in the same VPC in order to add the Security Group.
- Created a new files:
  - `config.toml` at [`aws/cfn/db`](/aws/cfn/db/config.toml)
  - `config.toml.example` at [`aws/cfn/db`](/aws/cfn/db/config.toml.example)
  - `db-deploy` at [`bin/cfn/`](/bin/cfn/db-deploy)

### Deployed the Service Layer
- Created a new files:
  - `config.toml` at [`aws/cfn/service`](/aws/cfn/service/config.toml)
  - `config.toml.example` at [`aws/cfn/service`](/aws/cfn/service/config.toml.example)
  - `service-deploy` at [`bin/cfn/`](/bin/cfn/service-deploy)
<img src="/assets/CFSrvc.png" width=450>
<figcaption>Service Layer Deployed</figcaption>   
<br/><br/>
<img src="/assets/CFSrvc-2.png" width=450>
<figcaption>Service Layer Deployed</figcaption>   
<br/><br/>

**Troubleshooting Service Layer** An unknown health check status was consistently being returned for the Backend Service and in addition, the CF Servirce Layer was in an endlless loop which ultimately would fail and rollback.   
**Resolution** What ultimately resolved the issue was checking the following list as there were many changes during the lesson:
(CF = CloudFormation):
1. Parameter Store set to CF DB.
2. CF DbRDS running.
3. CF DbSG set to port 5432, Source CF ClusterServiceSG
4. ClusterServiceSG set to port 4567, Source CF ALBSG
5. CF ALGSB set to allow all HTTPS,HTTP traffic.
6. Although this was not the case when we built the services without CF, Target Group/Health checks settings should be set to Override Port 4567.
**NOTE:** The optimal Happy Path is; Internet → ALB → ClusterService(ECS) → DB
<img src="/assets/health-check-true.png" width=450>
<figcaption>Health Check Success</figcaption>   
<br/><br/>

### Deployed the DynamoDB Layer
- Installed the AWS Service Application Model (SAM) - an open-source framework for building serverless applications with shorthand syntax for functions, APIs, databases, and event source mappings.
- Created a new files and structure:
  - `config.toml` at [`ddb/`](/aws/cfn/service/config.toml)
  - `config.toml.example` at [`ddb/`](/aws/cfn/service/config.toml.example)
  - `build` at [`ddb/`](ddb/build)
  -   Creates the .aws-sam directory and template.yaml file.
  - `packages` at [`ddb/`](ddb/package)
  -   This command creates a .zip file of your code and dependencies, and uploads the file to Amazon Simple Storage Service (Amazon S3).
  - `deploy` at [`ddb/`](ddb/deploy)

<img src="/assets/#" width=450>
<figcaption>DynamoDB Layer Deployed</figcaption>   
<br/><br/>
<img src="/assets/#" width=450>
<figcaption>DynamoDB Layer Deployed</figcaption>   
<br/><br/>
