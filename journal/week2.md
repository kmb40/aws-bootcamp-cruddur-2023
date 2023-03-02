# Week 2 — Distributed Tracing

The following information outlines tasks that I've completed for Week 1 of the bootcamp.

Watched a series of videos and attended the live stream.
#### 1. [Attended Week 2 Live Stream]() 
#### 2. [Watched Instrument XRay](https://www.youtube.com/watch?v=n2DTsuBrD_A&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=32)
#### 3. [Watched Instrument CloudWatch Logs](https://www.youtube.com/watch?v=ipdFizZjOF4&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=33)
#### 4. [Watched Security observability](https://www.youtube.com/watch?v=bOf4ITxAcXc&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=31)
#### Instrumented HoneyComb
Integrated Honeycomb into the Cruddur application. Configured tracing and a custom span in [home activities](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-2/backend-flask/services/home_activities.py)

#### Instrumented AWS Xray
Integrated AWS Xray into the Cruddur application. Configured tracing, a custom segment and a custom subsegment as commented in [user activities](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-2/backend-flask/services/user_activities.py)

#### Instrumented Cloudwatch Logs
Integrated AWS CloudWatch logs into the Cruddur application. Configured as commented in [backend home activities](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-2/backend-flask/services/home_activities.py) and [backend app.py](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-2/backend-flask/services/home_activities.py)
<img src="/assets/cloudwatch-logs.png" width="450" alt="cloudwatch">

#### Instrumented Rollerbar
Integrated Rollbar into the Cruddur application. Configured as commented or seen in [backend App.py](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-2/backend-flask/requirements.txt), [backend requirements](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-2/backend-flask/requirements.txt), [Environmental Variables set in docker-compose](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-2/docker-compose.yml)   
<img src="/assets/rollbar.png" width="450" alt="rollbar">

#### Homework Challenges
1. Honeycomb
 - Added a custom span "home-activities..." for home activities. Reference "#Honeycomb" in [backend-flask](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-2/backend-flask/services/home_activities.py)  
<img src="/assets/honeycomb-custom-span.png" width="450" alt="honeycomb">
- Added two attributes to the custom span (app.now = time stamp and app.result_length)
