- view: base_orderprofitability
  sql_table_name: blackbuck_prod.base_orderprofitability
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: estimated_cost
    type: number
    sql: ${TABLE}.estimated_cost

  - dimension: estimated_profitability
    type: number
    sql: ${TABLE}.estimated_profitability

  - dimension: estimated_revenue
    type: number
    sql: ${TABLE}.estimated_revenue

  - dimension: ops_cost
    type: number
    sql: ${TABLE}.ops_cost

  - dimension: ops_profitability
    type: number
    sql: ${TABLE}.ops_profitability

  - dimension: ops_revenue
    type: number
    sql: ${TABLE}.ops_revenue

  - dimension: order_id
    type: number
    sql: ${TABLE}.order_id

  - dimension: total_cost
    type: number
    sql: ${TABLE}.total_cost

  - dimension: total_profitability
    type: number
    sql: ${TABLE}.total_profitability

  - dimension: total_revenue
    type: number
    sql: ${TABLE}.total_revenue

  - measure: count
    type: count
    drill_fields: [id]
    
  - measure: total_revenue_today
    type: sum
    sql: ${TABLE}.total_revenue
    filters:
       base_order.end_date : today
    drill_fields: [order_id,total_revenue]
       
  - measure: total_revenue_yesterday
    type: sum
    sql: ${TABLE}.total_revenue
    filters:
       base_order.end_date : yesterday
    drill_fields: [order_id,total_revenue]
       
  - measure: change_revenue
    type: number
    sql:   100*(${total_revenue_today}-${total_revenue_yesterday})/NULLIF(${total_revenue_yesterday},0)
    value_format_name : decimal_2
     
  - measure: Total_Revenue
    type: sum
    sql: ${total_revenue}
    
  - measure: Total_Cost
    type: sum
    sql: ${total_cost}
    
  - measure: Total_Profitability
    type: number
    sql: 100*(${Total_Revenue}-${Total_Cost})/NULLIF(${Total_Revenue},0)
    value_format_name: decimal_1
    
    drill_fields: [order_id,base_order.user_id,auth_user.Full_name,From_City.city,To_city.city,base_order.end_date,total_revenue,total_cost,total_profitability]