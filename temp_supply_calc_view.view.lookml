- view: temp_supply_calc_view


  derived_table:
   sql: 
     SELECT CAST(@rownum := @rownum + 1 AS UNSIGNED) AS prim_key, x.* FROM (SELECT a.from_city_id as from_city_id,a.to_city_id as to_city_id,c.city as from_city,K.city as to_city ,new.y as SP_name,COUNT( a.id ) as location_orders, new.z as SP_orders
     FROM base_order AS a
     LEFT JOIN auth_user AS b ON b.id = a.supply_partner_id
     LEFT JOIN base_location AS c ON c.id = a.from_city_id
     LEFT JOIN base_location AS K ON K.id = a.to_city_id
     LEFT JOIN ( Select c.city as x,K.city as q , CONCAT(b.first_name,' ',b.last_name) as y ,count(a.id) as z FROM base_order as a LEFT JOIN auth_user AS b ON b.id = a.supply_partner_id
     LEFT JOIN base_location AS c ON c.id = a.from_city_id
     LEFT JOIN base_location AS K ON K.id = a.to_city_id
     WHERE (a.end_date between date('2016-09-01') and date('2016-09-10')) and a.user_id != 3
     GROUP BY 1,2,3)new ON new.x = c.city and new.q = K.city
     WHERE (a.end_date between date('2016-09-01') and date('2016-09-10')) and a.user_id != 3
     GROUP BY 1,2,3,4,5) as x, (SELECT @rownum := 0) r
    
   sql_trigger_value: SELECT CURDATE()
   indexes: [prim_key]
     
     
  fields:
  
 
  
  
  
  - dimension: from_city
    type: string
    sql: ${TABLE}.from_city
    
  - dimension: to_city
    type: string
    sql: ${TABLE}.to_city
    
  - dimension_group: end_date
    type: time
    timeframes: [time, date, week, month,hour,hour_of_day,raw,day_of_week]
    sql: ${TABLE}.end_date
    
  - dimension: SP_orders
    type: number
    sql: ${TABLE}.SP_orders
    
  - dimension: prim_key
    type: number
    primary_key: true
    sql: ${TABLE}.prim_key
    
    
  - dimension: from_city_id
    type: number
    sql: ${TABLE}.from_city_id
    
  - dimension: to_city_id
    type: number
    sql: ${TABLE}.to_city_id
    
    
    
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
    value_format_name: decimal_1
    

    


