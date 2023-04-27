# Week 8 — Serverless Image Processing

The following information outlines tasks that I've completed for Week 8 of the bootcamp.  

The **objective** was to allow end users of the application to upload their own profile avatar. To accomplish this, I developed and deployed a serverless functionality with object storage and event-bus actions.  
<img src="/assets/image-processing.png" width=450>
<figcaption>Serverless Image Process</figcaption>   
<br/><br/>  

#### 1. [Attended - Live Stream](https://www.youtube.com/watch?v=YiSNlK4bk90&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv)
#### 2. [Watched - Severeless CDK](https://www.youtube.com/watch?v=jyUpZP2knBI)
#### 3. [Watched - Serving Avatars via CloudFront](https://www.youtube.com/watch?v=Hl5XVb7dL6I&t)
#### 4. [Watched - Implement Users Profile Page](https://www.youtube.com/watch?v=WdVPx-LLjQ8)
#### 5. [Watched - Implement Migrations Backend Endpoint and Profile Form](https://www.youtube.com/watch?v=PTafksks528&t)
#### 6. [Watched - Implement Avatar Uploading (Part 1)](https://www.youtube.com/watch?v=Bk2tq4pliy8)
#### 7. [Watched - Fix CORS for API Gateway](https://www.youtube.com/watch?v=eO7bw6_nOIc)
#### 8. [Watched - Fix CORS Final AWS Lambda Layers](https://www.youtube.com/watch?v=uWhdz5unipA)
#### 9. [Watched - Render Avatar from CloudFront](https://www.youtube.com/watch?v=xrFo3QLoBp8)

### Prep Environment 

#### Installed the AWS Cloud Development Kit (CDK)
Essentially the CDK is used for creating, managing, and deleting infrastructure (services, VMs, DBs, etc) using a progaming language. CDK accomplishes this by producing CloudFormation templates, which are what is used to build your AWS infrastructure. [Reference - AWS Docs on CDK](https://docs.aws.amazon.com/cdk/v2/guide/home.html)

#### Bootstraped environment
The purpose of bootstrapping is to create a deployment environment in an AWS account that can be used to store and manage the resources required to deploy and manage CDK applications.  
- Run `cdk bootstrap "aws://$AWS_ACCOUNT_ID/$AWS_DEFAULT_REGION"`  
**Note:** Boostrapping is only required once per region.

#### Created directory for Cloud Development Kit(CDK) Pipeline
- Created a new directory named `thumbing-serverless-cdk`   
    - [Ref - thumbing-serverless-cdk](https://github.com/kmb40/aws-bootcamp-cruddur-2023/tree/main/thumbing-serverless-cdk)
```
cd /workspace/aws-bootcamp-cruddur-2023
mkdir thumbing-serverless-cdk   
```   
- Installed the AWS CDK using `npm install aws-cdk -g`.  
- Installed typescript which is the langauge that we will be using. Command: `cdk init app --language typescript`.  
- The [core of our code](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/main/thumbing-serverless-cdk/lib/thumbing-serverless-cdk-stack.ts) - built with typescript - used to build our infrastructure is `thumbing-serverless-cdk-stack.ts`. In this case we are creating an S3 bucket, Lambda functionality, SNS Topics, SNS Subscriptions, and attaching required policies.
- To view the composed code prior to deploying it, use the command - `cdk synth` - which produces YAML in the terminal that outlines what your code will produce in the CloudFormation (CFN) once deployed.
- To deploy use the composed `cdk deploy`.  
<img src="/assets/thumbing-cfn-bucket.png" width=450>
<figcaption>Outcome of deployment - S3 bucket</figcaption>   
<br/><br/>  

##### Configured s3
- The ThumbingCDK created the upload bucket.
- I manually created the assets bucket.

##### Configured s3 Permissions
- Added a CORS policy for the uploads s3 bucket.[Ref](https://github.com/kmb40/aws-bootcamp-cruddur-2023/edit/main/aws/policies/uploads-cors.json)
- Added a bucket policy for the assets s3 bucket.[Ref](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/main/aws/policies/assets-folder.json)

#### Develop Lambda functions
- One for Uploading. Obtains presigned url for s3 bucket and uploads/puts the image in the s3 bucket at that url. [Ref](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/main/aws/lambdas/cruddur-upload-avatar/function.rb)
- One for Authorizing. Verify that the uploader has the authority to perform uploads (is signed in via cognito) [Ref](https://github.com/kmb40/aws-bootcamp-cruddur-2023/tree/main/aws/lambdas/lambda-authorizer)
- One for Image Processing. Faciliate image processing when a file has been succesfully uplodaed to the uploads S3 bucket. [Ref](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/main/aws/lambdas/process-images/index.js)

##### Configured API Gateway
- Configured HTTP API Gateway.  
- Created a POST routed to `avatar/uploads`.  
- Attached [Authorizer](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/main/aws/lambdas/lambda-authorizer/index.js) to the route.  
- Integrate [upload lambda function](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/main/aws/lambdas/cruddur-upload-avatar/function.rb) to the route.  
**Note:** Activating access logging for the "default" stage caused noticable daily spend.  

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
<img src="/assets/profile-avatar.png" width=450>
<figcaption>Avatar Uploaded</figcaption>   
<br/><br/>  
