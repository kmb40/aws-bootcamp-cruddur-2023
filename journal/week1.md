# Week 1 — App Containerization

The following information outlines tasks that I've completed for Week 1 of the bootcamp.

Watched a series of videos and attended the live stream.
#### 1. [Watch How to Ask for Technical Help](https://www.youtube.com/watch?v=tDPqmwKMP7Y&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=29) 
#### 2. [Watched Grading Homework Summaries](https://www.youtube.com/watch?v=FKAScachFgk&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=25) 
#### 3. [Attended Week 1 Live Stream](https://www.youtube.com/watch?v=zJnNe5Nv4tE&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=22)  
#### 4. [Watched Remember to Commit your code](https://www.youtube.com/watch?v=b-idMgFFcpg&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=23) 
#### 5. [Watcked Chirag's Week 1 - Spending Considerations](https://www.youtube.com/watch?v=2W3KeqCjtDY) 
#### 6. [Watched Ashish's Week 1 - Container Security Considerations](https://www.youtube.com/watch?v=OjZz4D0B-cA&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=25)

#### Containerize Application (Dockerfiles, Docker Compose)
Containerized the front end and backend of the Cruddur application leveraging Gitpod. Configured the environment variables. Created docker files for the frontend and backend. Used Docker Compose to run both containers simutaneouly. Files can be referenced in github at [Frontend](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-1/frontend-react-js/Dockerfile), [Backend](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-1/backend-flask/Dockerfile), [Composer](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-1/docker-compose.yml)

#### Document the Notification Endpoint for the OpenAI Document
Started the containers for Cruddur and created an account in the app. Documented the notification endpoint OpenAI document by updating the yml file at [openapi-3.0.yml](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-1/backend-flask/services/notifications_activities.py). Actived the notifications feature by writing a Flask backend endpoint and writing a react page for notifications. Reference the created and updated files; [app.js](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-1/frontend-react-js/src/App.js), [app.py](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-1/backend-flask/app.py), [notifications_activities.py](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-1/backend-flask/services/notifications_activities.py)   

#### Run DynamoDB and Postgres Containers and ensure they work
I essentially updated [docker-compose.yml](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-1/docker-compose.yml) to support dynamodb and postgres databases. I viewed the database using the postgres extenion in Gitpod. I updated the [gitpod.yml](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-1/.gitpod.yml) to launch postgres viewer during workspace start.

#### Homework Challenges
This is an area I'd like to spend more time working. Updates for these challenges will be ongoing.
##### Updated 3/3 - Completed "Run the dockerfile CMD as an external script". Reference the [external script](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-2/backend-flask/external_script.sh) which is called from the [Dockerfile](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/main/backend-flask/Dockerfile) in the same directory.

##### Updated 3/27 - Completed Push and tag a image to DockerHub (they have a free tier)
- I completed this task by launching Gitpod, starting the container for the image "/backend-flask".
- Signed into Dockerhub (account created prior to Bootcamp).
- In the Gitpod terminal, ran `docker login -u [dockerhub username here]` to log into dockerhub.
-   Entered dockerhub password when promoted.
- Ran `docker tag aws-bootcamp-cruddur-2023/backend-flask:latest kmb40/cloudcamp-2023:backend-flask` to assign a tag for the source (github) and destination (dockerhub) image.
- Ran `docker push kmb40/cloudcamp-2023:backend-flask` to push the image from Github to dockerhub.
  <img src="/assets/gitpod-pushed-image.png" width=450>  
- Task completed!  
  <img src="/assets/dockerhub-pushed-image.png" width=450>  

##### Completed - Launch an EC2 instance that has docker installed, and pull a container to demonstrate you can run your own docker processes. 
- Leveraged an AWS marketplace to find an image that contained docker.
- Confirgured it with SSH and key pairs and launched it.  
  <img src="/assets/ec2-instance.png" width=450>  
- Launched local terminal and connected via SSH.  
   <img src="/assets/ec2-docker.png" width=450>  
- Ran the following commands  
-   `docker login -u [dockerhub username]`
-   `docker pull [dockerhub path th image and tag]` to pull the image for "backend-flask" from [docker hub](https://hub.docker.com/repository/docker/kmb40/cloudcamp-2023/general).
  <img src="/assets/ec2-docker-pull.png" width=450>  
-   `docker image ls` to display images contained in Docker on the EC2 instance.
  <img src="/assets/ec2-docker.png" width=450>  
