# Week 6 — Deploying Containers

The following information outlines tasks that I've completed for Week 6 of the bootcamp.  

#### 1. [Attended Week 6 Live Stream - Deploying Containers](https://www.youtube.com/watch?v=FklBsHWYvWY)  
#### 2. [Watched Week 6-7 - ECS Fargate (Part 1)](https://www.youtube.com/watch?v=QIZx2NhdCMI)  
#### 3. [Watched Week 6 ECS (Part2)](https://www.youtube.com/watch?v=HHmpZ5hqh1I)  
#### 4. [Watched Ashish's Amazon ECS Security Best Practices](https://www.youtube.com/watch?v=zz2FQAk1I28)

### Prep Enviroment
##### Configure Health Checks for RDS
Created a new script `backend-flask/bin/db/test`. [Ref](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-6/backend-flask/bin/db/test)   

##### Configure Health Checks for the Flask App
- Edited `backend-flask/app.py` with   
`@app.route('/api/health-check')`  
`def health_check():`  
` return {'success': True}, 200`

- Created a new script `backend-flask/bin/flask/health-check`. [Ref](https://github.com/kmb40/aws-bootcamp-cruddur-2023/blob/week-6/backend-flask/bin/flask/health-check)

<img src="/assets/" width=450>
<figcaption>Fig Data Modeling</figcaption>   
<br/><br/>  
