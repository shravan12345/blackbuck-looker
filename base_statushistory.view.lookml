- view: base_statushistory
  
  sql_table_name: blackbuck_prod.base_statushistory
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
    timeframes: [time, date,week, month, raw]
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
    drill_fields: [id,order_id, unblock_reason,unblock_comment,base_order.status,base_order.end_date,From_City.city,To_city.city]
    filters:
        base_statushistory.unblock_reason : "1,2,3,4,5,6,7,8"
    
  - measure: date_updated
    type: date
    sql: ${TABLE}.dt_updated
    
  - measure: count_noshow
    type: sum
    sql: CASE WHEN ${unblock_reason} IS NOT NULL THEN 1 ELSE 0 END
    drill_fields: [order_id,count_noshow]
    
  - measure: count_rejected
    type: sum
    sql: CASE WHEN ${unblock_reason} IS NOT NULL THEN 1 ELSE 0 END
    drill_fields: [order_id,count_rejected]
    
  - measure: count_true
    type: count
    
  

