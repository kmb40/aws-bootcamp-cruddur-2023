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
   
#### Created and imported an .sql script
```
psql cruddur < db/schema.sql -h localhost -U postgres
```
