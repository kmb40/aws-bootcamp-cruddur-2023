# Week 6 — Deploying Containers

The following information outlines tasks that I've completed for Week 6 of the bootcamp.  

### 1. [Attended Week 6 Live Stream - Deploying Containers](https://www.youtube.com/watch?v=FklBsHWYvWY)  
### 2. [Watched Week 6-7 - ECS Fargate (Part 1)](https://www.youtube.com/watch?v=QIZx2NhdCMI)  
### 3. [Watched Week 6 ECS (Part2)](https://www.youtube.com/watch?v=HHmpZ5hqh1I)  
### 4. [Watched Ashish's Amazon ECS Security Best Practices](https://www.youtube.com/watch?v=zz2FQAk1I28)

### Prep Environment
#### Configure Health Checks for RDS
Created a new script `backend-flask/bin/db/test`. [Ref](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-6/backend-flask/bin/db/test)   

#### Configure Health Checks for the Flask App
- Edited `backend-flask/app.py` with:   
```
@app.route('/api/health-check')  
def health_check():  
  return {'success': True}, 200
```  
- Created a new script `backend-flask/bin/flask/health-check`. [Ref](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-6/backend-flask/bin/flask/health-check)
- Create Cloudwatch Log Group with 1 day (to control cost) retention named `cruddur/fargate-cluster` using the following code:  
```
aws logs create-log-group --log-group-name cruddur  
aws logs put-retention-policy --log-group-name cruddur --retention-in-days 1`  
```
<img src="/assets/cruddur-fargate-cloudwatch-log-group.png" width=450>
<figcaption>Fargate Cloudwatch Log Group</figcaption>   
<br/><br/>  

- Created ECS Cluster  
```   
aws ecs create-cluster \
--cluster-name cruddur \
--service-connect-defaults namespace=cruddur
```   
<img src="/assets/cruddur-fargate-log-group.png" width=450>
<figcaption>Fargate ECS Cluster</figcaption>   
<br/><br/>  

#### Create three repositories and push three images (Base, Flask Backend, React Frontend)

**First** - Sign into ECR from Gitpod CLI using `aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin "$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com"`.  
**Note:** This command contains varibales that should be set in your environment however, the commands with the actual data can be found in the "View Push Commands" section of AWS ECR for your Repo.

#### Create the **Base** repository  
1. Create the AWS ECR repo using:
 ```
 aws ecr create-repository \
  --repository-name cruddur-python \
  --image-tag-mutability MUTABLE
  ```   
2. Set the path to the repo with `export ECR_PYTHON_URL="$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/cruddur-python"` then `echo $ECR_PYTHON_URL`.  
3. Pull the slim buster image to your environment (Gitpod in my case) using `docker pull python:3.10-slim-buster`.   
4. Tag the image using the command `docker tag python:3.10-slim-buster $ECR_PYTHON_URL:3.10-slim-buster`.  
**Note:** You can confirm that the command worked using `docker images` to view the image and tag.  
5. Push the image from your envrionement (Gitpod in my case) to your AWS ECR repo using `docker push $ECR_PYTHON_URL:3.10-slim-buster`.  
6. Confirgure the Flask app to use the pushed image at AWS ECR by changing the first line of `backend-flask/dockerfile` first line to reflect `FROM [your-account-id-here].dkr.ecr.[your-region-here].amazonaws.com/cruddur-python:3.10-slim-buster`.  
7. Run Docker Compose up.
**Note:** If you receive an authorization error, be sure that you have logged in as illustrated in step 1.  

#### Create the **Flask Backend** repository  
1. Create the AWS ECR repo using:
 ```
aws ecr create-repository \
  --repository-name backend-flask \
  --image-tag-mutability MUTABLE
  ```   
2. Set the path using:
```
export ECR_BACKEND_FLASK_URL="$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/backend-flask"
echo $ECR_BACKEND_FLASK_URL
```  
3. Build the image using `docker build -t backend-flask .`  
**Note:** I pulled an existing image for the Base build. Here we are building the image in our environment then pushing it to ECR.  
4. Tag the image using `docker tag backend-flask:latest $ECR_BACKEND_FLASK_URL:latest`  
5. Push the image to AWS ECR using `docker push $ECR_BACKEND_FLASK_URL:latest`  

#### Create Task Definitions
Create a new directory and file as follows `aws/task-definitions/backend-flask.json`.  
**Note:** Parameters and IAM Roles must be setup first.   
**Note:** Next, be sure to update all variables to match your own.   

#### Set Parameters for AWS Systems Manager Parameter Store  
```
aws ssm put-parameter --type "SecureString" --name "/cruddur/backend-flask/AWS_ACCESS_KEY_ID" --value $AWS_ACCESS_KEY_ID
aws ssm put-parameter --type "SecureString" --name "/cruddur/backend-flask/AWS_SECRET_ACCESS_KEY" --value $AWS_SECRET_ACCESS_KEY
aws ssm put-parameter --type "SecureString" --name "/cruddur/backend-flask/CONNECTION_URL" --value $PROD_CONNECTION_URL
aws ssm put-parameter --type "SecureString" --name "/cruddur/backend-flask/ROLLBAR_ACCESS_TOKEN" --value $ROLLBAR_ACCESS_TOKEN
aws ssm put-parameter --type "SecureString" --name "/cruddur/backend-flask/OTEL_EXPORTER_OTLP_HEADERS" --value "x-honeycomb-team=$HONEYCOMB_API_KEY"
```   
#### Created IAM Roles CruddurServiceExecutionRole and CruddurTaskRole  
Created `CruddurServiceExecutionRole` using:
```
aws iam create-role \
    --role-name CruddurServiceExecutionRole \
    --assume-role-policy-document "{
  \"Version\":\"2012-10-17\",
  \"Statement\":[{
    \"Action\":[\"sts:AssumeRole\"],
    \"Effect\":\"Allow\",
    \"Principal\":{
      \"Service\":[\"ecs-tasks.amazonaws.com\"]
    }
  }]
}"
```

- Created `CruddurServiceExecutionPolicy` using the AWS IAM GUI.   
- Attached `CruddurServiceExecutionPolicy` to `CruddurServiceExecutionRole` using the AWS IAM GUI.

#### Set Task Definitions  
- Created `CruddurTaskRole` role using:
```
aws iam create-role \
    --role-name CruddurTaskRole \
    --assume-role-policy-document "{
  \"Version\":\"2012-10-17\",
  \"Statement\":[{
    \"Action\":[\"sts:AssumeRole\"],
    \"Effect\":\"Allow\",
    \"Principal\":{
      \"Service\":[\"ecs-tasks.amazonaws.com\"]
    }
  }]
}"
```
- Created `SSMAccessPolicy` policy and attached it to the role `CruddurTaskRole` using:
```
aws iam put-role-policy \
  --policy-name SSMAccessPolicy \
  --role-name CruddurTaskRole \
  --policy-document "{
  \"Version\":\"2012-10-17\",
  \"Statement\":[{
    \"Action\":[
      \"ssmmessages:CreateControlChannel\",
      \"ssmmessages:CreateDataChannel\",
      \"ssmmessages:OpenControlChannel\",
      \"ssmmessages:OpenDataChannel\"
    ],
    \"Effect\":\"Allow\",
    \"Resource\":\"*\"
  }]
}
"
```
- Attached policies `CloudWatchFullAccess` and `AWSXRayDaemonWriteAccess` to the role `CruddurTaskRole` using:
```
aws iam attach-role-policy --policy-arn arn:aws:iam::aws:policy/CloudWatchFullAccess --role-name CruddurTaskRole
aws iam attach-role-policy --policy-arn arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess --role-name CruddurTaskRole
```
#### Registered tasks definitions using:
`aws ecs register-task-definition --cli-input-json file://aws/task-definitions/backend-flask.json`

#### Set VPC Default using:
```sh
export DEFAULT_VPC_ID=$(aws ec2 describe-vpcs \
--filters "Name=isDefault, Values=true" \
--query "Vpcs[0].VpcId" \
--output text)
echo $DEFAULT_VPC_ID
```
#### Create Security Group  
```sh
export CRUD_SERVICE_SG=$(aws ec2 create-security-group \
  --group-name "crud-srv-sg" \
  --description "Security group for Cruddur services on ECS" \
  --vpc-id $DEFAULT_VPC_ID \
  --query "GroupId" --output text)
echo $CRUD_SERVICE_SG
```
```
aws ec2 authorize-security-group-ingress \
  --group-id $CRUD_SERVICE_SG \
  --protocol tcp \
  --port 80 \
  --cidr 0.0.0.0/0
```
### Launch backend container with AWS ECS 
- Create service for the cruddur cluster in the AWS ECS console.
<img src="/assets/cruddur-cluster-create-service.png" width=450>
<figcaption>ECS Cruddur Cluster Create</figcaption>   
<br/><br/>  

**IMPORTANT Note:** Be sure that the `CruddurServiceExecutionRole` has all of the required permissions in the attached policy `CruddurServiceExecutionPolicy` as follows:
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ecr:GetAuthorizationToken",
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "ssm:GetParameters",
                "ssm:GetParameter"
            ],
            "Resource": "arn:aws:ssm:us-east-1:734732107779:parameter/cruddur/backend-flask/*"
        }
    ]
}
```
And `CloudWatchFullAccess`   

#### And after all of that, I deleted the service from the AWS ECS GUI in order to recreate it via AWS CLI.  

#### Installed AWS ECS `execute-command`  
Created file `aws/json/service-backend-flask.json` and popuated with security groups and subnets specific to my VPC. I grabbed the subnets from the AWS ECS gui by cicking vpc --> Subnets --> tick the top checkbox to select all subnets and copy them in CSV from the bottom of the screen.   

#### Installed Session Manager Plugin
```curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
sudo dpkg -i session-manager-plugin.deb```

#### Connect to container in AWS ECS
```
aws ecs execute-command  \
--region $AWS_DEFAULT_REGION \
--cluster cruddur \
--task [your aws ecs container arn here] \
--container backend-flask \
--command "/bin/bash" \
--interactive
```
### Attempt to run the backend-flask image   

