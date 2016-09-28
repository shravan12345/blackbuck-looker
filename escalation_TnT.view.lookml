- view: escalation_tnt
  derived table:
   sql:
     SELECT a.* FROM
     base_trucktrackstatus as a 
     WHERE dt_added = ( SELECT MAX(b.dt_added) from base_trucktrackstatus as b where a.order_id = b.order_id) and secondary_status IS NOT NULL;
     
  fields:
  
  
   - dimension: secondary_status
     type: number
     sql: ${TABLE}.secondary_status
     
   - dimension: id 
     type: number
     primary_key: true
     sql: ${TABLE}.id
     
   - dimension: order_id
     type: number
     sql: ${TABLE}.order_id
     
   - dimension: called_by
     type: string
     sql: ${TABLE}.called_by
     
   - dimension_group: dt_added
     type: time
     time_frames: [time, date, week, month,hour,hour_of_day,raw,day_of_week]
     sql: ${TABLE}.end_date
     
   - dimension: called_to
     type: string
     sql: ${TABLE}.called_to
      
     
   - dimension: secondary_status_name  
     sql_case:
        "Vehicle Broke": ${secondary_status} = 0
        "Theft": ${secondary_status} = 1
        "Accident": ${secondary_status} = 2
        "Way Bill Missing": ${secondary_status} = 3
        "Other Documents Missing": ${secondary_status} = 4
        "Waiting for Unload": ${secondary_status} = 5
        "Delayed": ${secondary_status} = 6
        "Stuck at Toll": ${secondary_status} = 7
        "On Track": ${secondary_status} = 8
        "Not Answered": ${secondary_status} = 9
        "Others": ${secondary_status} = 99
        
   - measure: count
     type: count
       
       
       
        
    
