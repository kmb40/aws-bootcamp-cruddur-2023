# Week 0 — Billing and Architecture

The following information outlines tasks that I've completed for Week 0 of the bootcamp.  
#### Watched a series of videos and attended the live stream.
#### 1. [Attended Week 0 - Live Streamed Video](https://www.youtube.com/watch?v=SG8blanhAOg&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=12)  
#### 2. [Watched Chirag's Week 0 - Spend Considerations](https://www.youtube.com/watch?v=OVw3RrlP-sI&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=13) 
#### 3. [Watched Ashish's Week 0 - Security Considerations](https://www.youtube.com/watch?v=4EMWBYVggQI&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=15)
#### Cruddur Conceptual Diagram 

* Napkin Version  
<img src="https://user-images.githubusercontent.com/1646055/218515054-589de2bd-d983-402a-9de4-45ef00cb5697.jpg" width="450">

* Digital Version(<a href="https://lucid.app/lucidchart/d6001220-63ae-4bc7-afe6-215c53ae4aba/edit?viewport_loc=-131%2C-40%2C2219%2C1151%2C0_0&invitationId=inv_4664376a-d244-4bde-9003-d7d1e637cfd3" target="_blank">Lucid Charts version</a>)
<img src="https://user-images.githubusercontent.com/1646055/218799773-54122b31-3e7a-49f4-8e6f-2064a5833402.png" width="450">

#### Logical Diagram (<a href="https://lucid.app/lucidchart/d6001220-63ae-4bc7-afe6-215c53ae4aba/edit?viewport_loc=-175%2C29%2C2219%2C1151%2CqOXwPx8sbkf~&invitationId=inv_4664376a-d244-4bde-9003-d7d1e637cfd3" target="_blank">Lucid Charts</a>)     

**Note:**  Amazon provides a useful style guide and digital assets at https://aws.amazon.com/architecture/icons/.   
<img width="450" alt="Screenshot 2023-02-14 at 6 36 04 PM" src="https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/main/assets/Cruddur%20-%20Diagrams%20-%20Logical.png">
#### Creating an admin account
My objectives here were to create an admin account and enabled multi-factor authentication (MFA). I have an existing account prior to this project so I decided to use AWS organizations https://aws.amazon.com/organizations/ to make account management easier. As such, I created an new orgination and within the organizations, I added a new AWS account for this project.  

#### Use CloudShell
After launching this service from the console menu, I activated Auto-prompt. [Auto-prompt](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-parameters-prompting.html) which functions similar to [Googles auto suggest](https://support.google.com/websearch/answer/7368877?hl=en#:~:text=Autocomplete%20is%20a%20feature%20within,they%20already%20intended%20to%20do.) feature. I then called the `aws sts get-caller-identity` command as seen below.  
![AWS CloudShell](/assets/aws-cloudshell.png)

#### Generated AWS Credentials  
I generated Access Keys and intend to use them for AWS CLI access.  

#### Install AWS CLI  
I installed AWS CLI in a gitpod workspace.  
![AWS CLI Installed on gitpod](/assets/gitpod-aws-cli.png)

#### Create a Billing Alarm
I configured a billing alarm by selecting the two alarms options in the "billing preferences" section of the "account" page. As illustarted in [Chirag's Week 0 - Spend Considerations](#2-watched-chirags-week-0---spend-considerations). I completed setup a new billing alarm in Cloud Watch and created an SNS Topics to faciliated email notifications.  Additonally I completed this task from a gitpod using CLI commands.
<img width="450" alt="Screenshot 2023-02-14 at 6 36 04 PM" src="/assets/alarm.png">

#### Create an AWS Budget
I configured two "cost" budgets. One using the template for "Zero Spend" and the other custom for AWS credits. Additonally I completed this task from a gitpod using CLI commands and removed the zero spend to avoid billable activities.  

<img width="450" alt="Screenshot 2023-02-14 at 6 36 04 PM" src="/assets/budgets.png">   

**Note:** During AWS budget creation from an IAM admin account, I was presented with a "You need permissions" error. ![budget-error](/assets/budget-error.png).  
I ultimately resovled this by activating IAM Access in the "IAM User and Role Access to Billing Information" section of the root accounts "account" section. In other words; Root user --> Account --> "IAM User and Role Access to Billing Information". [Reference](https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_billing.html?icmpid=docs_iam_console#tutorial-billing-step1).  

**Note:** The free tier only allows for two budgets before becoming billiable. 

#### Homework Challenges
- Destroy your root account credentials, Set MFA, IAM role. **Completed all of these tasks in both the root account as well as the IAM role.**  
![mfa](/assets/root-mfa.png)  
- Use EventBridge to hookup Health Dashboard to SNS and send notification when there is a service health issue.  **Completed! Created an SNS Topic then used EventBridge to define a rule that targets thata SNS in the event of a AWS Health Service issue related to all "EC2" events.**  
![event-bridge-health-sns](/assets/event-bridge.png)  

- Review all the questions of each pillars in the Well Architected Tool (No specialized lens)  **Completed the questionaires - without lenses - for the Operation Excellence, Security, Reliability, Performance efficency, Cost Optimization pillars, and Sustainability. Found the questions and answers to be thought provoking and full of best practices. Generated a report which can be found in this repo at** [Cruddur Well Architected Tool Report](/assets/Cruddur_wellarchitected.pdf)

- Create an architectural diagram (to the best of your ability) the CI/CD logical pipeline in Lucid Charts. **Completed and attached**  
<img width="450" alt="cicd-pipeline" src="/assets/CI_CD%20pipeline.png">

- Research the technical and service limits of specific services and how they could impact the technical path for technical flexibility. **Completed. Service limits are the maximum values for the resources in an AWS account. These limits can serve as boundaries from which the technical path should consider and request adjustments as needed.** [Reference](https://docs.aws.amazon.com/servicequotas/latest/userguide/intro.html)  

- Open a support ticket and request a service limit. **Completed. I requested a Service Quota increase for S3 Access Points** <img width="450" alt="service-quota-limits" src="/assets/service-limit-quotas.png">
