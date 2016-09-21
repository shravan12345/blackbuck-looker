- view: supply_breath_calc
  derived_table:
   sql: 
     SELECT a.from_city_id as city_id,c.city as city,new.y as SP_name,COUNT( a.id ) as location_orders , new.z as SP_orders
     FROM base_order AS a
     LEFT JOIN auth_user AS b ON b.id = a.supply_partner_id
     LEFT JOIN base_location AS c ON c.id = a.from_city_id
     LEFT JOIN ( Select c.city as x  , CONCAT(b.first_name,' ',b.last_name) as y ,count(a.id) as z FROM base_order as a LEFT JOIN auth_user AS b ON b.id = a.supply_partner_id
     LEFT JOIN base_location AS c ON c.id = a.from_city_id
     GROUP BY 1,2)new ON new.x = c.city GROUP BY 1,2,3;
     
     
  fields:
  
  
  - dimension: city
    type: string
    sql: ${TABLE}.city
    
  - dimension_group: end_date
    type: time
    timeframes: [time, date, week, month,hour,hour_of_day,raw,day_of_week]
    sql: ${TABLE}.end_date
    
  - dimension: SP_orders
    type: number
    sql: ${TABLE}.SP_orders
    
  - dimension: from_city_id
    type: number
    sql: ${TABLE}.city_id
    
  - dimension: Location_orders
    type: number
    sql: ${TABLE}.location_orders
    
    
  - measure: Supply_breadth_index
    type: sum
    sql: power(${SP_orders}/${Location_orders},2)
    value_format_name: decimal_1
    
  - measure: supply_breadth
    type: number
    sql: (1 - ${Supply_breadth_index})
    
    


