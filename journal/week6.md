# Week 6 — Deploying Containers

The following information outlines tasks that I've completed for Week 6 of the bootcamp.  

#### 1. [Attended Week 6 Live Stream - Deploying Containers](https://www.youtube.com/watch?v=FklBsHWYvWY)  
#### 2. [Watched Week 6-7 - ECS Fargate (Part 1)](https://www.youtube.com/watch?v=QIZx2NhdCMI)  
#### 3. [Watched Week 6 ECS (Part2)](https://www.youtube.com/watch?v=HHmpZ5hqh1I)  
#### 4. [Watched Ashish's Amazon ECS Security Best Practices](https://www.youtube.com/watch?v=zz2FQAk1I28)

### Prep Environment
##### Configure Health Checks for RDS
Created a new script `backend-flask/bin/db/test`. [Ref](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-6/backend-flask/bin/db/test)   

##### Configure Health Checks for the Flask App
- Edited `backend-flask/app.py` with:   
```
@app.route('/api/health-check')  
def health_check():  
  return {'success': True}, 200
```  
- Created a new script `backend-flask/bin/flask/health-check`. [Ref](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-6/backend-flask/bin/flask/health-check)
- Create Cloudwatch Log Group with 1 day (to control cost) retention named `cruddur/fargate-cluster` using the following code:  
```
aws logs create-log-group --log-group-name cruddur/fargate-cluster  
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
<img src="/assets/cruddur-fargate-ecs-cluster.png" width=450>
<figcaption>Fargate ECS Cluster</figcaption>   
<br/><br/>  

##### Create three repositories and push three images (Base, Flask Backend, React Frontend)
##### Create the **Base** repository  
1. Create the AWS ECR repo using:
 ```
 aws ecr create-repository \
  --repository-name cruddur-python \
  --image-tag-mutability MUTABLE
  ```   
2. Sign into ECR from Gitpod CLI using `aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin "$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com"`.  
**Note:** This command contains varibales that should be set in your environment however, the commands with the actual data can be found in the "View Push Commands" section of AWS ECR for your Repo.

3. Set the path to the repo with `export ECR_PYTHON_URL="$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/cruddur-python"` then `echo $ECR_PYTHON_URL`.  
4. Pull the slim buster image to your environment (Gitpod in my case) using `docker pull python:3.10-slim-buster`.   
5. Tag the image using the command `docker tag python:3.10-slim-buster $ECR_PYTHON_URL:3.10-slim-buster`.  
**Note:** You can confirm that the command worked using `docker images` to view the image and tag.  
6. Push the image from your envrionement (Gitpod in my case) to your AWS ECR repo using `docker push $ECR_PYTHON_URL:3.10-slim-buster`.  
7. Confirgure the Flask app to use the pushed image at AWS ECR by changing the first line of `backend-flask/dockerfile` first line to reflect `FROM [your-account-id-here].dkr.ecr.[your-region-here].amazonaws.com/cruddur-python:3.10-slim-buster`.  
8. Run Docker Compose up.
**Note:** If you receive an authorization error, be sure that you have logged in as illustrated in step 1.  

##### Create the **Backend-flask** repository  
