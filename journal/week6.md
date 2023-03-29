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
##### Create IAM Roles CruddurServiceExecutionRole and CruddurTaskRole  
Created two policy files `aws/policies/service-assume-role-execution-policy.json` and `aws/policies/service-execution-policy.json`.  

#### Set Task Definitions  

Attempt to run the backend and base image.  
