# Week 10 — CloudFormation Part 1

The following information outlines tasks that I've completed for Week 10 of the bootcamp. 

The objective is to create and deploy a CloudFormation (CFN) Template for our cluster and load balancer.

### 1. [Attended - Live Stream](https://www.youtube.com/watch?v=BRmEG4zicM0)  

#### Envrionment Prep  
- Created a new folder `CFN`.
- Created template file in [`aws/cfn/template.yaml`](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-10/aws/cfn/template.yaml).
- Created deploy file in [`bin/cfn/deploy`](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-10/bin/cfn/deploy).
- Execute the deployment using - `/bin/cfn/deploy`.
- CloudFormation Linter (cfn-lint) is an open-source tool that you can use to perform detailed validation on your AWS CloudFormation templates. Installed using ` pip install cfn-lint`.
-   Added to gitpod.yml using:
```
  - name: cfn
    before: |
      pip install cfn-lint
```
- Created `task-definition.guard` at `/aws/cfn/
- Installed `cfn-guard` using `cargo install cfn-guard`
-   Add to gitpod.yml
- Paused cfn-guard implementation to keep focused on CFN
- Created s3 bucket named `cfn-artifiacts` to hold template file.
-   Updated `deploy` file to send template file to s3 bucket.

<img src="/assets/cfn-artifacts.png" width=450>
<figcaption>CFN Artifacts S3 Bucket</figcaption>   
<br/><br/>  
