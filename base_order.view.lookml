- view: base_order
  sql_table_name: blackbuck_prod.base_order
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: accepted_by
    type: number
    sql: ${TABLE}.accepted_by

  - dimension: accepted_by_imei_id
    type: number
    sql: ${TABLE}.accepted_by_imei_id

  - dimension: adhoc_rate
    type: number
    sql: ${TABLE}.adhoc_rate

  - dimension: adhoc_rate_reference_id
    type: number
    sql: ${TABLE}.adhoc_rate_reference_id

  - dimension: app_accepted_account_id
    type: number
    sql: ${TABLE}.app_accepted_account_id

  - dimension: assigned_driver_id
    type: number
    sql: ${TABLE}.assigned_driver_id

  - dimension: assigned_truck_id
    type: number
    sql: ${TABLE}.assigned_truck_id

  - dimension: bill_exchange_reqd
    type: yesno
    sql: ${TABLE}.bill_exchange_reqd

  - dimension: bonus_amount
    type: number
    sql: ${TABLE}.bonus_amount

  - dimension: bonus_scheme_id
    type: number
    sql: ${TABLE}.bonus_scheme_id

  - dimension: broker_id
    type: number
    sql: ${TABLE}.broker_id

  - dimension: cancel_reason_id
    type: number
    sql: ${TABLE}.cancel_reason_id

  - dimension: contracted_rate_id
    type: number
    sql: ${TABLE}.contracted_rate_id

  - dimension: created_by_id
    type: number
    sql: ${TABLE}.created_by_id

  - dimension: custom_requirements
    type: string
    sql: ${TABLE}.custom_requirements

  - dimension: customer_order_id
    type: number
    sql: ${TABLE}.customer_order_id

  - dimension: cutoff_duration
    type: number
    sql: ${TABLE}.cutoff_duration

  - dimension: discount_percentage
    type: number
    sql: ${TABLE}.discount_percentage

  - dimension: distance
    type: number
    sql: ${TABLE}.distance

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_date

  - dimension: end_location_id
    type: number
    sql: ${TABLE}.end_location_id

  - dimension_group: expiry
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.expiry_date

  - dimension: fleet_supply_partner_id
    type: number
    sql: ${TABLE}.fleet_supply_partner_id

  - dimension: from_city_id
    type: number
    sql: ${TABLE}.from_city_id

  - dimension: invoice_images
    type: string
    sql: ${TABLE}.invoice_images

  - dimension: lane_id
    type: number
    sql: ${TABLE}.lane_id

  - dimension: manual_placement
    type: yesno
    sql: ${TABLE}.manual_placement

  - dimension: market_price
    type: string
    sql: ${TABLE}.market_price

  - dimension: material_mvmt_type
    type: number
    sql: ${TABLE}.material_mvmt_type

  - dimension: mg_contract_id
    type: number
    sql: ${TABLE}.mg_contract_id

  - dimension: mode_of_payment
    type: number
    sql: ${TABLE}.mode_of_payment

  - dimension: no_outlets
    type: number
    sql: ${TABLE}.no_outlets

  - dimension: no_trips
    type: number
    sql: ${TABLE}.no_trips

  - dimension: no_trucks
    type: number
    sql: ${TABLE}.no_trucks

  - dimension: num_loading_points
    type: number
    sql: ${TABLE}.num_loading_points

  - dimension: num_unloading_points
    type: number
    sql: ${TABLE}.num_unloading_points

  - dimension: ops_user_id
    type: number
    sql: ${TABLE}.ops_user_id

  - dimension: optimized_loading
    type: yesno
    sql: ${TABLE}.optimized_loading

  - dimension: order_invoice_status
    type: string
    sql: ${TABLE}.order_invoice_status

  - dimension: order_value
    type: number
    sql: ${TABLE}.order_value

  - dimension: owner_id
    type: number
    sql: ${TABLE}.owner_id

  - dimension: payment_status_customer
    type: string
    sql: ${TABLE}.payment_status_customer

  - dimension: payment_status_truck
    type: string
    sql: ${TABLE}.payment_status_truck

  - dimension: product_id
    type: number
    sql: ${TABLE}.product_id

  - dimension: profitability_index
    type: number
    sql: ${TABLE}.profitability_index

  - dimension: rate_type
    type: number
    sql: ${TABLE}.rate_type

  - dimension: receivables
    type: number
    sql: ${TABLE}.receivables

  - dimension_group: reporting
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.reporting_time

  - dimension: routes_covered
    type: number
    sql: ${TABLE}.routes_covered

  - dimension: shipment_type
    type: number
    sql: ${TABLE}.shipment_type

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_date

  - dimension: start_location_id
    type: number
    sql: ${TABLE}.start_location_id

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension_group: status_transition_expiry
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.status_transition_expiry_time

  - dimension_group: status_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.status_updated_time

  - dimension: stock_quantity
    type: number
    sql: ${TABLE}.stock_quantity

  - dimension: supply_partner_id
    type: number
    sql: ${TABLE}.supply_partner_id

  - dimension: to_city_id
    type: number
    sql: ${TABLE}.to_city_id

  - dimension: to_pay_model
    type: yesno
    sql: ${TABLE}.to_pay_model

  - dimension: tonnage
    type: number
    sql: ${TABLE}.tonnage

  - dimension: truck_type_id
    type: number
    sql: ${TABLE}.truck_type_id

  - dimension: unblock_reason
    type: number
    sql: ${TABLE}.unblock_reason

  - dimension: use_to_address_for_invoice
    type: yesno
    sql: ${TABLE}.use_to_address_for_invoice

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    filters:
        base_order.status: '-Cancelled , - Cancelled By Customer'
    drill_fields: detail*

 
  - measure: placement
    type : count
    filters:
        base_order.status : 'Truck Arrival Source,LR Generated,Order Completed,Advance DocVerification,Payment Pending,Payment Done,Truck Departure Destination,Truck In-Transit,Truck Arrival Destination,Truck Departure Destination,Truck Unloading,Settlement DocVerification,Settlement Pending, Settlement Done, Docs Received'
    drill_fields: detail*
    
  - measure: placement_index
    type: number
    sql: 1.0* ${placement}/ NULLIF(${count}, 0)
    drill_fields: detail*
    value_format_name: percent_1
    
  - measure: No_of_SP
    type: count_distinct
    sql: ${supply_partner_id}
    drill_fields: [supply_partner_id,auth_user.full_name,placement]
    
  - dimension_group: end_1
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_date
    
  - measure: Date
    type: date
    sql: ${TABLE}.end_date
    
  - measure: POD_Points_Index
    type: sum_distinct
    sql: CASE WHEN TIMESTAMPDIFF(day,${POD_Sub.dt_updated_raw},${TAD.dt_updated_raw}) < 2*TIMESTAMPDIFF(day,${TAD.dt_updated_raw},${TAS.dt_updated_raw}) + 10 THEN 1 ELSE 0 END
    drill_fields : [id,status,end_date]
    
 
         
         
  - measure: Avg_Order_Rate
    type: avg
    sql: NULLIF(${order_value},0)
    value_format_name: decimal_0
    drill_fields: detail*
    filters:
         base_order.end_date : 30 days
    
  
  sets:
    detail: 
        - id
        - user_id
        - status
        - start_date
        - end_date
        - From_City.city
        - To_city.city
        - order_value
        - base_orderprofitability.total_profitability
        
   