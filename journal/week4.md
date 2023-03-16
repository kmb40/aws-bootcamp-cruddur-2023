# Week 4 — Postgres and RDS

The following information outlines tasks that I've completed for Week 4 of the bootcamp.

Watched a series of videos and attended the live stream.
#### 1. [Attended Week 4 Live Stream](https://www.youtube.com/watch?v=EtD7Kv5YCUs) 
#### 2. [Watched Ashish's Week 4 - Security Considerations](https://www.youtube.com/watch?v=UourWxz7iQg&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=45) 
#### 3. [Watched Chirag Week 3 - Spending Considerations](#) 

#### Provisioned an AWS RDS Postgres Instance  
Setup an AWS RDS instance using the command line in Gitpod. Substituting proper instanace class, password, avaialbility zone, and port. 
```aws rds create-db-instance \
  --db-instance-identifier cruddur-db-instance \
  --db-instance-class db.t3.micro \
  --engine postgres \
  --engine-version  14.6 \
  --master-username root \
  --master-user-password huEE33z2Qvl383 \
  --allocated-storage 20 \
  --availability-zone ca-central-1a \
  --backup-retention-period 0 \
  --port 5432 \
  --no-multi-az \
  --db-name cruddur \
  --storage-type gp2 \
  --publicly-accessible \
  --storage-encrypted \
  --enable-performance-insights \
  --performance-insights-retention-period 7 \
  --no-deletion-protection
```
Reference the AWS console in Fig 1.  
<img src="/assets/RDS.png" width=450>
<figcaption>Fig 1</figcaption>   
   
Placed a temporary stop (7 days then system will restart) on the RDS database. Reference Fig 2.
<img src="/assets/RDS-Temporary-stop-b.png" width=450>
<figcaption>Fig 2</figcaption>   
   
#### Created and imported a .sql script
Created the "backend-flask/db" directory and "schema.sql" file, then used the following command to import the script.
```
psql cruddur < db/schema.sql -h localhost -U postgres
```
#### Wrote several bash scripts for database 
Created bash scripts for dropping, creating, schemas, seeding, and setup which runs the four scripts mentioned. I also created a db-sessions script which displays processes that are running. Reference [backend-flask/bin](https://github.com/kmb40/aws-bootcamp-cruddur-2023/tree/week-4-redux/backend-flask/bin)  

#### Installed Postgres Driver in Backend Application  
Succesfully installed psycopg Postgres driver. Installed by adding to the [requirements.txt](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-4-redux/backend-flask/requirements.txt) and running pip install in the backend-flask directory. I then conducted extensive troubleshooting primarily in the home_activities.py to resolve various errors specifically with environmental variables. Reference files [home_activities.py](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-4-redux/backend-flask/services/home_activities.py), [db.py](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-4-redux/backend-flask/lib/db.py), and [docker-compose.yml](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-4-redux/docker-compose.yml).  

#### Connected Gitpod to AWS RDS Instance
Modified the RDS instance security group to allow inbound traffic from Gitpod. Succesfully connected to AWS RDS from Gitpod. Created a batch script - [rds-update-sg-rule](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-4-redux/backend-flask/bin/rds-update-sg-rule) - to account for dynamic IP addresses for security group values. In other words, since the IP addresses assigned by Gitpod are dynamic and subject to change, this script calls the IP address and sends it to the AWS security group when the Gitpod space is started.
 
#### Created Congito Trigger to insert user into database
The objective is to have the new user data -orchestrated using AWS Cognito - inserted into the AWS RDS database after new user account creation. I created a Lamda function.  
<img src="/assests/AWS-Lambda.png" width=450>
