# Week 9 — CI/CD with CodePipeline, CodeBuild and CodeDeploy

The following information outlines tasks that I've completed for Week 9 of the bootcamp. 

### 1. [Attended - Live Stream](https://www.youtube.com/watch?v=DLYfI0ehMZE&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=81)  
### 2. [Watched - Fix CodeBuild Issues](https://www.youtube.com/watch?v=jyUpZP2knBI)  
### 3. [Watched - CodePiepline](https://www.youtube.com/watch?v=EAudiRT9Alw)

#### Created a Buildspec.yml file. [Ref](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/main/backend-flask/buildspec.yml)

#### Setup CodeBuild
- Launched CodeBuild  
**Note:** Encountered a "GetAuthorizationToken" error which wasn't observed in the video. I overcame it with some research and added those permissions to our CodeBuild Role which resolved the error. 
```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "VisualEditor0",
      "Effect": "Allow",
      "Action": [
        "ecr:BatchCheckLayerAvailability",
        "ecr:CompleteLayerUpload",
        "ecr:GetAuthorizationToken",
        "ecr:InitiateLayerUpload",
        "ecr:PutImage",
        "ecr:UploadLayerPart",
        "ecr:BatchGetImage",
        "ecr:GetDownloadUrlForLayer"
      ],
      "Resource": "*"
    }
  ]
}
```

<img src="/assets/codebuild.png" width=450>
<figcaption>CodeBuild</figcaption>   
<br/><br/>  

#### Setup CodePipeline
<img src="/assets/codepipeline.png" width=450>
<figcaption>CodePipeline</figcaption>   
<br/><br/>  
<img src="/assets/CodePipeline2.png" width=450>
<figcaption>CodePipeline Expanded</figcaption>   
<br/><br/>  
