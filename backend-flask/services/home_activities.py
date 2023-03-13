from datetime import datetime, timedelta, timezone
#Honeycomb
from opentelemetry import trace 

#Honeycomb
#tracer = trace.get_tracer("home.activities")

class HomeActivities:
  def run(cognito_user_id=None):
    #logger.info("HomeActivities") #CloudWatch logs
    #with tracer.start_as_current_span("home-activities-custom-span-mock-data"):  #Honeycomb custom span
      #span = trace.get_current_span() #Honeycomb attribute
      #now = datetime.now(timezone.utc).astimezone()
      #span.set_attribute("app.now", now.isoformat()) #Honeycomb attribute
      
      #span.set_attribute("app.result_length",len(results)) #Honeycomb attribute
      sql = db.template('activities','home')
      results = db.query_array_json(sql)
      return results
