# Week 5 — DynamoDB and Serverless Caching (HELL WEEK)

The following information outlines tasks that I've completed for Week 5 of the bootcamp.  

Due to the complexity of this weeks challenge it should be understood that a combination of conusming video content, reading this journal and having access to an environement for practical application and testing are essential to completing these tasks.

#### 1. [Attended Week 5 Live Stream](https://www.youtube.com/watch?v=5oZHNOaL8Og) 

##### DynamoDB Data Modeling for Cruddur
This critical planning step was perforemd and discussed during the video. The outcome - a single table desgin was the model that wiil be used for this application as illustrated in "Fig Data Modeling".  
<img src="/assets/DynamoDB%20Modelling.png" width=450>
<figcaption>Fig Data Modeling</figcaption>   
<br/><br/>  

#### 2. [Watched Ashish's Week 5 - How to use Amazon DynamoDB for security and speed](https://www.youtube.com/watch?v=gFPljPNnK2Q) 
#### 3. [Watched Lou's - What cloud hiring managers want from your resume](https://www.youtube.com/watch?v=S_89vwVHC9Y&t=0s)

#### Implemented conversations
##### Configured Environment for DynamoDB (local)
I installed "Boto3" by adding it to the [requirements.txt](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-5/backend-flask/requirements.txt) and running ``` pip intall -r requirments.txt .``` Additionally, I added this to the [gitpod.yml](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-5/.gitpod.yml) file with the name "flask" so that this installation would be automatted for future Gitpod workspace spin ups.  

I created a library for DynamoDB and stored it in a newly created file ```backend-flask/lib/ddb.py```. [Ref](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-5/backend-flask/lib/ddb.py) 

##### Additional configurations made were as follows:  
* Created a schema -``` backend-flask/bin/ddb/schema-load ``` - for the dynamodb table - "cruddur-messages". [Ref](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-5/backend-flask/bin/ddb/schema-load)
* Created a ```backend-flask/bin/ddb/scan``` file to check that the database displayed all of the data stored and was functioning properly. [Ref](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-5/backend-flask/bin/ddb/scan)
* Pointed to local postgres database with variable - `CONNECTION_URL: "postgresql://postgres:password@db:5432/cruddur"` in [docker-compose.yml](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-5/docker-compose.yml)
* **IMPORTANT!** - Updated ```backend-flask/ddb/seed.sql``` to include mock data for an actual production AWS Cognito account (mine). [Ref](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-5/backend-flask/bin/ddb/seed)  
* **IMPORTANT!** - Updated ```backend-flask/db/seed``` to swap the mock data - user handle "andrewbrown" - for an actual production AWS Cognito account (mine). [Ref](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-5/backend-flask/db/seed.sql)
* Consolidated and restructured several postgres db files. [Ref](https://github.com/kmb40/aws-bootcamp-cruddur-2023/commit/90ef2f831faa4b5d5786704566c4deff90cb09aa)
* Created multiple files and a ddb directory `backend-flask/bin/ddb/` to streamline and automate some of the dynamoDB task. [Ref](https://github.com/kmb40/aws-bootcamp-cruddur-2023/tree/week-5/backend-flask/bin/ddb)  
* Created `backend-flask/bin/ddb/patterns/get-conversation` to display messages associated with the hard-coded message_group_uuid. [Ref](https://github.com/kmb40/aws-bootcamp-cruddur-2023/commit/e30026356751b5587406d56c5d9110e0675a01d4)
* Created `backend-flask/bin/ddb/patterns/list-conversations` to display message groups. [Ref](https://github.com/kmb40/aws-bootcamp-cruddur-2023/commit/e30026356751b5587406d56c5d9110e0675a01d4)

#### Implemented (Pattern A) Listing Messages in Message Group into Application
Objective - As a user, I want to see a list of messages that belong to a message group. The messages must be ordered from newest to oldest.  
<img src="/assets/DynamoDB%20Modelling.png" width=450>
<figcaption>Pattern A</figcaption>   
<br/><br/>  

**Note:** Updated Cognito ID Script for Postgres Database  
Replacing the local cookie authentication method with the AWS Cognito powered token authentication method is a critical step. Extensive testing was required in part due to the complexity of the task, coding changes of hard coded variables to support dynamic data, and constant token expiration.

#### Implemented (Pattern B) Listing Messages Group into Application
Objective - As a user, I want to see a list of messages that belong to an existing message group. The messages must be ordered from newest to oldest.  
<img src="/assets/DynamoDB%20Modelling.png" width=450>
<figcaption>Pattern B</figcaption>   
<br/><br/>  

#### Implemented (Pattern C) Creating a Message for an existing Message Group into Application
Objective - As a user, I need the ability to create a new message in a new message group.
<img src="/assets/DynamoDB%20Modelling.png" width=450>
<figcaption>Pattern C</figcaption>   
<br/><br/>  

#### Implemented (Pattern D) Creating a Message for a new Message Group into Application
Objective - As a user, I need the ability to update an existing conversation with a new message and display it as the last message in the conversation.   
<img src="/assets/DynamoDB%20Modelling.png" width=450>
<figcaption>Pattern D</figcaption>   
<br/><br/>  

#### Implemented (Pattern E) Updating a Message Group using DynamoDB Streams
Update dynamoDB records for all messages.  
<img src="/assets/DynamoDB%20Modelling.png" width=450>
<figcaption>Pattern E</figcaption>   
<br/><br/>
