# Week 5 — DynamoDB and Serverless Caching (HELL WEEK)

The following information outlines tasks that I've completed for Week 5 of the bootcamp.

Watched a series of videos and attended the live stream.
#### 1. [Attended Week 5 Live Stream](https://www.youtube.com/watch?v=5oZHNOaL8Og) 
##### Understanding Data Modeling for DynamoDB
<img src="/assets/DynamoDB%20Modelling.png" width=450>
<figcaption>Fig Data Modeling</figcaption>   
<br/><br/>    
#### 2. [Watched Ashish's Week 5 - How to use Amazon DynamoDB for security and speed](https://www.youtube.com/watch?v=gFPljPNnK2Q) 

#### Implemented DynamoDB
First, I installed "Boto3" by adding it to the [requirements.txt](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-4-redux/backend-flask/requirements.txt) and running ``` pip intall -r requirments.txt .``` Additionally, I added this to the [gitpod.yml](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-5/.gitpod.yml) file with the name "flask" so that this installation would be automatted for future Gitpod workspaces spin ups.  

The next goal was to setup a local Dynamodb. I created a schema to build a table "cruddur-messages", seeded it with mock data, then scanned it to check that the database displayed the data and was functioning properly.

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
#### Updated Cognito ID Script for Postgres Database
#### Implemented (Pattern A) Listing Messages in Message Group into Application
#### Implemented (Pattern B) Listing Messages Group into Application
#### Implemented (Pattern C) Creating a Message for an existing Message Group into Application
#### Implemented (Pattern D) Creating a Message for a new Message Group into Application
#### Implemented (Pattern E) Updating a Message Group using DynamoDB Streams
