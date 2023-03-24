# Week 5 — DynamoDB and Serverless Caching (HELL WEEK)

The following information outlines tasks that I've completed for Week 5 of the bootcamp.

Watched a series of videos and attended the live stream.
#### 1. [Attended Week 5 Live Stream](https://www.youtube.com/watch?v=5oZHNOaL8Og) 
##### DynamoDB Data Modeling for Cruddur
The single table desgin was the model that was used for this application as illustrated in Fig Data Modeling.
<img src="/assets/DynamoDB%20Modelling.png" width=450>
<figcaption>Fig Data Modeling</figcaption>   
<br/><br/> 

#### 2. [Watched Ashish's Week 5 - How to use Amazon DynamoDB for security and speed](https://www.youtube.com/watch?v=gFPljPNnK2Q) 
#### 3. [Watched Lou's - What cloud hiring managers want from your resume](https://www.youtube.com/watch?v=S_89vwVHC9Y&t=0s)

#### Implemented DynamoDB
First, I installed "Boto3" by adding it to the [requirements.txt](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-4-redux/backend-flask/requirements.txt) and running ``` pip intall -r requirments.txt .``` Additionally, I added this to the [gitpod.yml](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-5/.gitpod.yml) file with the name "flask" so that this installation would be automatted for future Gitpod workspaces spin ups.  

The next goal was to setup a local Dynamodb. I created a schema to build a table named, "cruddur-messages", seeded it with mock data, then scanned it to check that the database displayed the data and was functioning properly.

#### Implemented conversations
First, I created a library for DynamoDB and stored in a newly created file backend-flask/lib/ddb.py. [requirements.txt](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-4-redux/backend-flask/requirements.txt) and running ``` pip intall -r requirments.txt .``` Additionally, I added this to the [gitpod.yml](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-5/.gitpod.yml) file with the name "flask" so that this installation would be automatted for future Gitpod workspaces spin ups.  

The next goal was to setup a local Dynamodb. I created a schema to build a table "cruddur-messages", seeded it with mock data, then scanned it to check that the database displayed the data and was functioning properly.

#### Implemented access Pattern B
Reference the AWS console in Fig 1.  
<img src="/assets/RDS.png" width=450>
<figcaption>Fig 1</figcaption>   
<br/><br/>    
   
##### Created and imported a .sql script
Created the "backend-flask/db" directory and "schema.sql" file, then used the following command to import the script.
```
psql cruddur < db/schema.sql -h localhost -U postgres
```
##### Wrote several bash scripts for database 
Created bash scripts for dropping, creating, schemas, seeding, and setup which runs the four scripts mentioned. I also created a db-sessions script which displays processes that are running. Reference [backend-flask/bin](https://github.com/kmb40/aws-bootcamp-cruddur-2023/tree/week-4-redux/backend-flask/bin)  

##### Installed Postgres Driver in Backend Application  
 and [docker-compose.yml](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-4-redux/docker-compose.yml).   

#### Implemented Pattern Scripts for Read and List Conversations
Created scripts to list conversations and get all conversations.

#### Updated Cognito ID Script for Postgres Database
Objective was to replace the local cookie authentication method with the AWS Cognito powered token authentication method. Extensive testing was required in part due to the complexity of the task, coding changes of hard coded variables to support dynamic data, and constant token expiration.

#### Implemented (Pattern A) Listing Messages in Message Group into Application
A user wants to see a list of messages that belong to a message group The messages must be ordered by the created_at timestamp from newest to oldest (DESC).

#### Implemented (Pattern B) Listing Messages Group into Application
A user wants to see a list of messages that belong to a message group The messages must be ordered by the created_at timestamp from newest to oldest (DESC).

#### Implemented (Pattern C) Creating a Message for an existing Message Group into Application
When a user creates a message we need to update the conversation to display the last message for the conversation.

#### Implemented (Pattern D) Creating a Message for a new Message Group into Application
When a user creates a new message we need to update the conversation to display the last message in the conversation.

#### Implemented (Pattern E) Updating a Message Group using DynamoDB Streams
Activated DynamoDB streams that capture item-level changes in tables, and push the changes to a DynamoDB stream which can then be accessed through the DynamoDB Streams API.
