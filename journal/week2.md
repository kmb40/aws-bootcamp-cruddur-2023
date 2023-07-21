# Week 2 — Distributed Tracing

The following information outlines tasks that I've completed for Week 2 of the bootcamp.
<img src="/assets/tracebility.png" width="450">   

Watched a series of videos and attended the live stream.
#### 1. [Attended Week 2 Live Stream](https://www.youtube.com/live/2GD9xCzRId4?feature=share) 
#### 2. [Watched Spending Considerations](https://www.youtube.com/watch?v=2W3KeqCjtDY)
#### 3. [Watched Security Observability](https://www.youtube.com/watch?v=bOf4ITxAcXc&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=31)
#### 4. [Watched Instrument Honeycomb with OTEL](https://www.youtube.com/watch?v=2GD9xCzRId4&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=30)
#### 5. [Watched Instrument XRay](https://www.youtube.com/watch?v=n2DTsuBrD_A&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=32)
#### 6. [Watched Instrument CloudWatch Logs](https://www.youtube.com/watch?v=ipdFizZjOF4&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=33)
#### 7. [Integrate Rollbar and capture and error](https://www.youtube.com/watch?v=xMBDAb5SEU4&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=35)

#### Instrumented HoneyComb
Integrated Honeycomb into the Cruddur application. Configured tracing and a custom span in [home activities](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-2/backend-flask/services/home_activities.py)

#### Instrumented AWS Xray
Integrated AWS Xray into the Cruddur application. Configured tracing, a custom segment and a custom subsegment as commented in [user activities](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-2/backend-flask/services/user_activities.py)

#### Instrumented AWS X-Ray Subsegments
Made and tested the suggested changes successfully.  See [details](https://github.com/kmb40/aws-bootcamp-cruddur-2023/edit/week-3/journal/week3.md#note-revisited-week-2---x-ray-subsegments-solved-as-it-was-added-after-i-had-submitted-homework-for-week-2-updated-week-2-journal-to-reflect-made-and-tested-the-suggested-changes-succesfully-hat-tip-to-olley-article-which-is-referenced-in-the-video--httpsolleyhashnodedevaws-free-cloud-bootcamp-instrumenting-aws-x-ray-subsegments).   
<img src="/assets/xray-subsegment.png" width="450"> 

#### Instrumented Cloudwatch Logs
Integrated AWS CloudWatch logs into the Cruddur application. Configured as commented in [backend home activities](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-2/backend-flask/services/home_activities.py) and [backend app.py](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-2/backend-flask/services/home_activities.py)
<img src="/assets/cloudwatch-logs.png" width="450" alt="cloudwatch">

#### Instrumented Rollerbar
Integrated Rollbar into the Cruddur application. Configured as commented or seen in [backend App.py](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-2/backend-flask/requirements.txt), [backend requirements](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-2/backend-flask/requirements.txt), [Environmental Variables set in docker-compose](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-2/docker-compose.yml)   
<img src="/assets/rollbar.png" width="450" alt="rollbar">

#### Homework Challenges
1. Honeycomb
 - Added a custom span "home-activities..." for home activities. Reference "#Honeycomb" in [backend-flask](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-2/backend-flask/services/home_activities.py)  
 - Added two attributes to the custom span (app.now = time stamp and app.result_length)  
<img src="/assets/honeycomb-custom-span.png" width="450" alt="honeycomb">   
  
 - Created and saved a custom query for Trace Volumes.   
<img src="/assets/honeycomb-custom-trace.png" width="450" alt="honeycomb-custom-trace">
