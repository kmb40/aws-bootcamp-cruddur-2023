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
<img width="450" alt="Screenshot 2023-02-14 at 6 36 04 PM" src="https://user-images.githubusercontent.com/1646055/218887221-9b29456e-0f36-4969-b058-b81f13499d43.png">
#### Creating an admin account
My objectives here were to create an admin account and enabled multi-factor authentication (MFA). I have an existing account prior to this project so I decided to use AWS organizations https://aws.amazon.com/organizations/ to make account management easier. As such, I created an new orgination and within the organizations, I added a new AWS account for this project.  

#### Homework Challenges
Additionally, I destroyed the root account credentials, reset them and re-enabled multi-factor authentication (MFA) since I had it active already. 

#### Use CloudShell
After launching this service from the console menu, I activated Auto-prompt. [Auto-prompt](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-parameters-prompting.html) which functions similar to [Googles auto suggest](https://support.google.com/websearch/answer/7368877?hl=en#:~:text=Autocomplete%20is%20a%20feature%20within,they%20already%20intended%20to%20do.) feature. I then called the `aws sts get-caller-identity` command as seen below.  
![AWS CloudShell](/assets/aws-cloudshell.png)

#### Generated AWS Credentials

#### Install AWS CLI
