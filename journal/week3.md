# Week 3 — Decentralized Authentication

The following information outlines tasks that I've completed for Week 3 of the bootcamp.

Watched a series of videos and attended the live stream.
#### 1. [Attended Week 3 Live Stream](#) 
#### 2. [Watched Ashish's Week 3 - Decenteralized Authentication](https://www.youtube.com/watch?v=tEJIeII66pY&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=39) 
#### 3. [Watched Chirag Week 3 - Spending Considerations](#) 
#### 4. [Watched Exploring JWTs](https://www.youtube.com/watch?v=nJjbI4BbasU&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=43)

#### Implement Custom Signin Page
Implemented a custom signin page leveraging AWS Cognito. Integrated code at Frontend-react-js/ [App.js](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-3/frontend-react-js/src/App.js), [HomeFeedPage.js](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-3/frontend-react-js/src/pages/HomeFeedPage.js), [Signin.js](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-3/frontend-react-js/src/pages/SigninPage.js), [docker-compose.yml](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-3/docker-compose.yml) and others as relfect at https://github.com/omenking/aws-bootcamp-cruddur-2023/blob/week-3/journal/week3.md. Setup a new user in AWS Cognito. Tested and confirmed login.  
<img src="/assets/cruddur-signed-in.png" width="450">  

Updated name and username attributes.  
<img src="/assets/cruddur-user-pool-b.png" width="450">  
Per instruction, the user I created was removed from Cognito since CLI workaround is required to address the forced to change password status assigned to users created in Cognito.

#### Implement Custom Signup Page
Implemented a custom signup page leveraging AWS Cognito. Integrated code at Frontend-react-js/ [ConfigurationPage.js](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-3/frontend-react-js/src/pages/ConfirmationPage.js), [SignupPage.js](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-3/frontend-react-js/src/pages/SignupPage.js), [docker-compose.yml](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-3/docker-compose.yml) and others as relfected at https://github.com/omenking/aws-bootcamp-cruddur-2023/blob/week-3/journal/week3.md. Confirmed that the new user exsited in in AWS Cognito. Tested and confirmed signup and login.  
<img src="/assets/signup-page.png" width="450">  

#### Implement Custom Recovery Page
Implemented a custom recovery page leveraging AWS Cognito. Integrated code at Frontend-react-js/ [ConfigurationPage.js](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-3/frontend-react-js/src/pages/ConfirmationPage.js) and [RecoveryPage.js](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-3/frontend-react-js/src/pages/RecoverPage.js). Tested and confirmed login with new password.  
<img src="/assets/recover-page.png" width="450">  

#### Implement Server Side Verifications with JSON Web Tokens
Implemented user authentication using JSON Web Token on the server side /backend as detailed at [Week 3 Congito JWT Server side Verify](https://www.youtube.com/watch?v=d079jccoG-M&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=42). Created a token [file](https://github.com/omenking/aws-bootcamp-cruddur-2023/blob/week-3-improved-ui/backend-flask/lib/cognito_jwt_token.py). Integrated code at Backend/ [home_activities.py](https://github.com/omenking/aws-bootcamp-cruddur-2023/blob/week-3-improved-ui/backend-flask/services/home_activities.py), [docker-compose.yml](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-3/docker-compose.yml) and others as relfected at https://github.com/omenking/aws-bootcamp-cruddur-2023/blob/week-3/journal/week3.md. To serve API endpoints in the Cruddur application. Further Reference - [AWS Docs - Using Tokens](https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-using-tokens-with-identity-providers.html)

**Note:** Revisited ["Week 2 - X-Ray Subsegments Solved"](https://www.youtube.com/watch?v=4SGTW0Db5y0&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=38) as it was added after I had submitted homework for week 2. Updated [Week 2 Journal to reflect](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-2/journal/week2.md#instrumented-aws-x-ray-subsegments). Made and tested the suggested changes succesfully. Hat tip to @Olley article which is referenced in the video @ https://olley.hashnode.dev/aws-free-cloud-bootcamp-instrumenting-aws-x-ray-subsegments  
<img src="/assets/xray-subsegment.png" width="450">  
