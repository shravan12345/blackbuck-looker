- view: repeat_sp
  derived_table:
   sql:
      SELECT a.from_city_id as city_id,b.city as city , CONCAT(c.first_name,'',c.last_name) as SP_Name , count(a.id) as Order_Count , (CASE WHEN count(a.id) > 1 THEN "YES" ELSE "NO" END) as Repeat_Alert from base_order as a 
      left join base_location as b ON b.id = a.from_city_id 
      left join auth_user as c ON c.id = a.supply_partner_id where supply_partner_id IS NOT NULL and a.end_date > NOW() - INTERVAL 7 DAY GROUP BY 1,2;
  
  
  
   fields:
   
   
   
   - dimension: city
     type: string
     sql: ${TABLE}.city
    
   - dimension: city_id
     type: number
     sql: ${TABLE}.city_id
    
   - dimension: order_count
     type: number
     sql: ${TABLE}.Order_Count
    
   - dimension: SP_name
     type: string
     sql: ${TABLE}.SP_Name
    
   - dimension: Repeat_Index
     type: yesno
     sql: ${TABLE}.Repeat_Alert = "YES" 
     
   - measure: count
     type: count_distinct
     sql: ${SP_name}
     filters:
         Repeat_Index : "Yes"
    
    
    
