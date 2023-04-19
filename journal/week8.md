# Week 8 — Serverless Image Processing

The following information outlines tasks that I've completed for Week 8 of the bootcamp.  

The **objective** was to allow end users of the application to upload their own profile avatar. To accomplish this, I developed and deployed a serverless functionality with object storage and event-bus actions.

### 1. [Attended - Live Stream](https://www.youtube.com/watch?v=YiSNlK4bk90&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv)  
### 2. [Watched - Severeless CDK](https://www.youtube.com/watch?v=jyUpZP2knBI)  
### 3. [Watched - Serving Avatars via CloudFront](https://www.youtube.com/watch?v=Hl5XVb7dL6I&t)
### 4. [Watched - Implement Users Profile Page](https://www.youtube.com/watch?v=WdVPx-LLjQ8)
### 5. [Watched - Implement Migrations Backend Endpoint and Profile Form](https://www.youtube.com/watch?v=PTafksks528&t)
### 6. [Watched - Implement Avatar Uploading (Part 1)](https://www.youtube.com/watch?v=Bk2tq4pliy8)
### 7. [Watched - Fix CORS for API Gateway](https://www.youtube.com/watch?v=eO7bw6_nOIc)
### 8. [Watched - Fix CORS Final AWS Lambda Layers](https://www.youtube.com/watch?v=uWhdz5unipA)
### 9. [Watched - Render Avatar from CloudFront](https://www.youtube.com/watch?v=xrFo3QLoBp8)

### Prep Environment 

### Installed the AWS Cloud Development Kit (CDK)
Essentially the CDK is used for creating, managing, and deleting infrastructure (services, VMs, DBs, etc) using a progaming language. CDK accomplishes this by producing CloudFormation templates, which are what is used to build your AWS infrastructure. [Reference - AWS Docs on CDK](https://docs.aws.amazon.com/cdk/v2/guide/home.html)

#### Bootstraped environment
The purpose of bootstrapping is to create a deployment environment in an AWS account that can be used to store and manage the resources required to deploy and manage CDK applications.  
- Run `cdk bootstrap "aws://$AWS_ACCOUNT_ID/$AWS_DEFAULT_REGION"`

#### Created directory for Cloud Development Kit(CDK) Pipeline
- Created a new directory named `thumbing-serverless-cdk`  
```
cd /workspace/aws-bootcamp-cruddur-2023
mkdir thumbing-serverless-cdk
```  
- [Ref - thumbing-serverless-cdk](https://github.com/kmb40/aws-bootcamp-cruddur-2023/tree/main/thumbing-serverless-cdk)
- Installed the AWS CDK using `npm install aws-cdk -g`.  

#### Configured s3

##### Configured s3 Permissions

##### Configured API Gateway
- **Note:** Activating access logging for the "default" stage caused noticable daily spend.  

#### Configured lamda

#### Configured SNS

### Setup up CloudFront

### Implemented User Profile Page
- Created directory in S3 bucket - via console - named `banner`.  
- Uploaded background image to `banner`.

### Implemented profile page
- Created new files in frontend-react-js
```
ProfileHeading.css
ProfileHeading.js
EditProfileButton.css
EditProfileButton.js
```
- Styled profile page.

### Implemented Migrations Backend Endpoint and Profile Form  
- Configured migration and rollback database funtions.
- Setup popup form for capturing bio information.
    - Note: Be sure to call your own @handle when viewing profile.

### Implemented Avatar Uploading
- Implement client side upload for S3.
- Leveraged API gateway
- Installed aws jwt verify using `npm install aws-jwt-verify --save`

### Fixed CORS API Gateway Issue
- Conducted extensive troubleshooting to resovled CORS issues during avatar upload.
    - Assessed API Gateway
    - Assessed LambdaAuthorizer function
    - Assessed LambdaUpload function
    - Assessed Frontend Code
- Implemented Lamda layer

### Rendered Avatar from Cloudfront
- Configured avatar to leverage Cloudfront
