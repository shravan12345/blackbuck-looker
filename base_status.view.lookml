- view: base_status
  sql_table_name: blackbuck_prod.base_status
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: approval_comment
    type: string
    sql: ${TABLE}.approval_comment

  - dimension: approval_or_rejection_enum
    type: number
    sql: ${TABLE}.approval_or_rejection_enum

  - dimension: approval_reason
    type: number
    sql: ${TABLE}.approval_reason

  - dimension: blocked_by_name
    type: string
    sql: ${TABLE}.blocked_by_name

  - dimension: bonus_amount
    type: number
    sql: ${TABLE}.bonus_amount

  - dimension: bonus_scheme_id
    type: number
    sql: ${TABLE}.bonus_scheme_id

  - dimension: broker_name
    type: string
    sql: ${TABLE}.broker_name

  - dimension: broker_number
    type: string
    sql: ${TABLE}.broker_number

  - dimension: driver_name
    type: string
    sql: ${TABLE}.driver_name

  - dimension: driver_number
    type: string
    sql: ${TABLE}.driver_number

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension_group: dt_updated
    type: time
    timeframes: [time, date, week, month,raw]
    sql: ${TABLE}.dt_updated

  - dimension: helper_number
    type: string
    sql: ${TABLE}.helper_number

  - dimension: last_modified_by_id
    type: number
    sql: ${TABLE}.last_modified_by_id

  - dimension: loading_charge
    type: number
    sql: ${TABLE}.loading_charge

  - dimension: mobile_number
    type: string
    sql: ${TABLE}.mobile_number

  - dimension: order_id
    type: number
    sql: ${TABLE}.order_id

  - dimension: order_value
    type: number
    sql: ${TABLE}.order_value

  - dimension: registration_number
    type: string
    sql: ${TABLE}.registration_number

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension: status_msg
    type: string
    sql: ${TABLE}.status_msg

  - dimension: supply_partner_id
    type: number
    sql: ${TABLE}.supply_partner_id

  - dimension: transition_comment
    type: string
    sql: ${TABLE}.transition_comment

  - dimension: transition_reason_enum
    type: number
    sql: ${TABLE}.transition_reason_enum

  - dimension: transition_type
    type: number
    sql: ${TABLE}.transition_type

  - dimension: truck_type_id
    type: number
    sql: ${TABLE}.truck_type_id

  - dimension: unblock_comment
    type: string
    sql: ${TABLE}.unblock_comment

  - dimension: unblock_reason
    type: number
    sql: ${TABLE}.unblock_reason

  - dimension: unloading_charge
    type: number
    sql: ${TABLE}.unloading_charge

  - measure: count
    type: count
    drill_fields: [id, blocked_by_name, driver_name, broker_name]
    
  - measure: Count_24
    type: count_distinct
    sql: CASE WHEN TIMESTAMPDIFF(hour,${base_order.end_raw},${dt_updated_raw}) < 24 AND ${status} = 'Truck Arrival Source' THEN ${order_id} ELSE 0 END
    filters:
        base_order.status : ['Truck Arrival Source', 'LR Generated', 'Advance DocVerification',
       'Advance Docs Rejected' , 'Advance Docs Approval Requested','Payment Pending', 'Advance Payment Rejected' ,
       'Payment Done', 'Order Finalized', 'Started Trip',
       'Truck Departure Source', 'Truck In-Transit', 'Truck Arrival Destination',
       'Truck Unloading', 'Truck Departure Destination', 'Settlement DocVerification',
       'Settlement Docs Rejected','Settlement Docs Approval Requested','Settlement Pending',
       'Settlement Payment Rejected', 'Settlement Done', 'Docs Pending','Docs Received',
       'Order Completed']
    drill_fields: [order_id,base_order.end_date,base_order.status] 
    
  - measure: Count_48
    type: count_distinct
    sql: CASE WHEN (TIMESTAMPDIFF(hour,${base_order.end_raw},${dt_updated_raw}) < 48 and TIMESTAMPDIFF(hour,${base_order.end_raw},${dt_updated_raw}) > 24) AND ${status} = 'Truck Arrival Source' THEN ${order_id} ELSE 0 END
    filters:
        base_order.status : ['Truck Arrival Source', 'LR Generated', 'Advance DocVerification',
       'Advance Docs Rejected' , 'Advance Docs Approval Requested','Payment Pending', 'Advance Payment Rejected' ,
       'Payment Done', 'Order Finalized', 'Started Trip',
       'Truck Departure Source', 'Truck In-Transit', 'Truck Arrival Destination',
       'Truck Unloading', 'Truck Departure Destination', 'Settlement DocVerification',
       'Settlement Docs Rejected','Settlement Docs Approval Requested','Settlement Pending',
       'Settlement Payment Rejected', 'Settlement Done', 'Docs Pending','Docs Received',
       'Order Completed']
    drill_fields: [order_id,base_order.end_date,base_order.status]   
    
  - measure: PI_24
    type: number
    sql: 100*${Count_24}/${base_order.count}
    value_format_name: decimal_1
    drill_fields: detail*
    html: |
        <a href={{ base_status.Count_24._link }}> {{ rendered_value }} </a>
    
  - measure: PI_48
    type: number
    sql: 100*${Count_48}/${base_order.count}
    value_format_name: decimal_1
    drill_fields: detail*
    
  
  sets:
    detail: 
        - base_order.id
        - base_order.user_id
        - base_order.status
        - base_order.end_date
        - From_City.city
        - To_city.city
        - base_order.order_value
        - base_orderdynamicprice.cft_price
        - base_order.order_invoice_status  
    

# Ask Chris that why this join is not working as desired 


