# Week X - Clean Up and validate functionality 

The following information outlines tasks that I've completed for Week X of the bootcamp. 

The objective is to clean up the application and validate functionality as any new course topics have officially ended (5/13/23).

### 1. [Attended - Live Stream](https://www.youtube.com/watch?v=Bi_pjuM3u2o&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=111)  
### 2. [Watched Week X Sync tool for static website hosting](https://www.youtube.com/watch?v=jPdm0uLyFLM)
### 3. [Watched Week X Reconnect Database and Post Confirmation Lambda](https://youtu.be/0nDBqZGu4rI)
### 4. [Watched Week X Use CORS for Service](https://youtu.be/f0aLm0EpzaE)
### 5. [Watched Week-X CICD Pipeline and Create Activity](https://youtu.be/H9-9gR604L4)
### 6. [Watched Week-X Refactor JWT to use a decorator](https://youtu.be/4lHRwJ0yzpo)
### 7. [Watched Week-X Refactor AppPy](https://www.youtube.com/watch?v=VSVb_-6zYaY)
### 8. [Watched Week-X Refactor Flask Routes](https://www.youtube.com/watch?v=INkTj-Ark7k&t=19s)
### 9. [Watched Week-X Replies Work In Progress](https://www.youtube.com/watch?v=qXxYF4y0gJ8&t)
### 10. [Watched Week-X Refactor Error Handling and Fetch Requests](https://www.youtube.com/watch?v=rFcPG6e_kGs&t)
### 11. [Watched Week-X Activity Show Page](https://www.youtube.com/watch?v=FBpQtN497QA&t)
### 12. [Watched Week-X Cleanup](https://www.youtube.com/watch?v=E89RBvZ_BaY)
### 13. [Watched Week-X Cleanup Part 2](https://youtu.be/53_3TmZ1hrs)

### Created Frontend Files
- Deployed the following code:
```
REACT_APP_BACKEND_URL="https://api.cruddur.net" \
REACT_APP_AWS_PROJECT_REGION="$AWS_DEFAULT_REGION" \
REACT_APP_AWS_COGNITO_REGION="$AWS_DEFAULT_REGION" \
REACT_APP_AWS_USER_POOLS_ID="us-east-1_Pzbe5SksT" \
REACT_APP_CLIENT_ID="3fh1vt9f05kih07blqk4if3oqb" \
npm run build
```
- Corrected multiple warnings found as a result. [Ref](https://github.com/kmb40/aws-bootcamp-cruddur-2023/commit/706ed44662ad2fa556817ec20b2ae917ff72bcd6)
- Created [`bin/frontend/static-build`](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/706ed44662ad2fa556817ec20b2ae917ff72bcd6/bin/frontend/static-build).
- Compressed `frontend-react-js/build` into zip.
- Download the zip and extract the contents.

#### Enter Sync Tool 
- [Teacherseat Github](https://github.com/teacherseat/aws-s3-website-sync)
- Create [`bin/frontend/sync`](/bin/frontend/sync).
- Install `gem install aws_s3_website_sync`.
- Install `gem install dotenv`.

<img src="/assets/frontend-cf.png" width=450>
<figcaption>CFN Frontend</figcaption>   
<br/><br/>  

<img src="/assets/frontend-cf-2.png" width=450>
<figcaption>CFN Frontend</figcaption>   
<br/><br/>  

- Upload the contents to S3 bucket named `cruddur.net`.    
<img src="/assets/static-frontend-bucket.png" width=450>
<figcaption>Frontend S3 Bucket</figcaption>   
<br/><br/>  

### Reconnect Database and Post Confirmation Lambda to Application
#### Prep
- Stablized the app to make sure backend and frontent images are current. 
- Run:
- `bin\backend\build` - builds the image
- `bin\backend\push` - pushes the image to ECR
- `bin\backend\register`- registers a new task definition
- In the CF Fargate Service - Update the backend container with latest task definiton created in the previous step.  
- Update env varibles for with `export DB_SG_RULE_ID="NEW CFN Security Group Rule ID"` AND `gp env DB_SG_RULE_ID="NEW CFN Security Group Rule ID"`
- Update env varibles for with `export DB_SG_ID="NEW CFN Security Group ID"` AND `gp env DB_SG_ID="NEW CFN Security Group ID"`
- Connect to production (AWS RDS) Postgres db.  
**NOTE:** Be sure that the enviroment variables are pointing to the production database.   
**NOTE:** The site frontend failed to show and actitvies results so we pivoted to setting up a new conginto user by signing up again (and deleting the existing account).    
  - We then pivoted to creating an error message to show instead of a blank page.
  - Updated [`bin\cfn\frontend\template.yaml`](#) to include custom error page code.   
**NOTE:** Be sure that Lambda for post comfirmation has the correct env varibles set in the configuration section.   
**NOTE:** There may be a timeout error displayed after new signup on cruddur and following the confirmation verification. 
- In the AWS Console - Updated Lambda for post confirmation to reflect the correct Cruddur (CFN) VPC and not the default VPC.
- In the AWS Console - Create a new security group `CognitoLambdaSG` for Lambda
- In the AWS Console - Updated the Lambda for post confirmation to reflect the correct Cruddur (CFN) public subnets.
- In the AWS Console - Updated Lambda for post confirmation [`aws/lambdas/cruddur-post-confirrmation.py`](https://github.com/kmb40/aws-bootcamp-cruddur-2023/commit/92d392e1a85aa8b825ff66847909395c423296ab)   

**Conclusion** Successfully reconnected the AWS RDS postgres db to the application and configured the confirmation lambda into the production enviroment.   
<img src="/assets/cruddur.net-postgres-success.png" width=450>
<figcaption>Frontend S3 Bucket</figcaption>   
<br/><br/>  

### CI/CD Pipeline and Post Create Activity
- Corrected several misconfigured options in [`template.yaml`](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-x/aws/cfn/cicd/template.yaml) and [`nested\codebuild.yaml`](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-x/aws/cfn/cicd/nested/codebuild.yaml).     

### Refactor JWT to use a decorator
- Made substantial changes to implement a decorator. Primarily [`backend-flask/lib/cognito_jwt_token.py`](https://github.com/kmb40/aws-bootcamp-cruddur-2023/commit/f0e687796ccff97ab608fd8ac00cc66a219d11f2#diff-c4205e0c1fabfa8932a580cf9b109f3af4c9fe9c738868a9c7f8d83212db9c24) and [`backend-flask/app.py`](https://github.com/kmb40/aws-bootcamp-cruddur-2023/commit/6bc499cd9f426750930c4ede9bd21c075be52a43?diff=unified).

### Refactor `backend-flask/app.py
- Made substantial changes to `backend-flask\app.py`.
