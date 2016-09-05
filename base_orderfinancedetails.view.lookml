- view: base_orderfinancedetails
  sql_table_name: blackbuck_prod.base_orderfinancedetails
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: advance_cash_amount
    type: number
    sql: ${TABLE}.advance_cash_amount

  - dimension: advance_cash_paid
    type: yesno
    sql: ${TABLE}.advance_cash_paid

  - dimension: advance_channel
    type: number
    sql: ${TABLE}.advance_channel

  - dimension: advance_etransfer_amount
    type: number
    sql: ${TABLE}.advance_etransfer_amount

  - dimension: advance_etransfer_paid
    type: yesno
    sql: ${TABLE}.advance_etransfer_paid

  - dimension: advance_fuel_amount
    type: number
    sql: ${TABLE}.advance_fuel_amount

  - dimension: advance_fuel_paid
    type: yesno
    sql: ${TABLE}.advance_fuel_paid

  - dimension: advance_fuel_percentage
    type: number
    sql: ${TABLE}.advance_fuel_percentage

  - dimension: advance_payment_method_id
    type: number
    sql: ${TABLE}.advance_payment_method_id

  - dimension: advance_voucher_image
    type: string
    sql: ${TABLE}.advance_voucher_image

  - dimension: bonus_amount
    type: number
    sql: ${TABLE}.bonus_amount

  - dimension: checkpost_bills_images
    type: string
    sql: ${TABLE}.checkpost_bills_images

  - dimension: consignment_note_images
    type: string
    sql: ${TABLE}.consignment_note_images

  - dimension: damage_recovered_amount
    type: number
    sql: ${TABLE}.damage_recovered_amount

  - dimension: damage_recovered_type
    type: number
    sql: ${TABLE}.damage_recovered_type

  - dimension: damages
    type: number
    sql: ${TABLE}.damages

  - dimension: dest_halt_charges
    type: number
    sql: ${TABLE}.dest_halt_charges

  - dimension: dest_halt_duration
    type: number
    sql: ${TABLE}.dest_halt_duration

  - dimension: dest_halt_reason
    type: number
    sql: ${TABLE}.dest_halt_reason

  - dimension: dest_misc_comments
    type: string
    sql: ${TABLE}.dest_misc_comments

  - dimension: equivalent_weight
    type: number
    sql: ${TABLE}.equivalent_weight

  - dimension: freight_amount
    type: number
    sql: ${TABLE}.freight_amount

  - dimension: halt_charges
    type: number
    sql: ${TABLE}.halt_charges

  - dimension: halt_duration
    type: number
    sql: ${TABLE}.halt_duration

  - dimension: halt_reason
    type: number
    sql: ${TABLE}.halt_reason

  - dimension: included_loading_charges
    type: number
    sql: ${TABLE}.included_loading_charges

  - dimension: included_unloading_charges
    type: number
    sql: ${TABLE}.included_unloading_charges

  - dimension: invoice_images
    type: string
    sql: ${TABLE}.invoice_images

  - dimension: loading_charges
    type: number
    sql: ${TABLE}.loading_charges

  - dimension: lr_image
    type: string
    sql: ${TABLE}.lr_image

  - dimension: lr_number
    type: string
    sql: ${TABLE}.lr_number

  - dimension: order_id
    type: number
    sql: ${TABLE}.order_id

  - dimension: pod_images
    type: string
    sql: ${TABLE}.pod_images

  - dimension: settlement_cash_amount
    type: number
    sql: ${TABLE}.settlement_cash_amount

  - dimension: settlement_cash_paid
    type: yesno
    sql: ${TABLE}.settlement_cash_paid

  - dimension: settlement_channel
    type: number
    sql: ${TABLE}.settlement_channel

  - dimension: settlement_etransfer_amount
    type: number
    sql: ${TABLE}.settlement_etransfer_amount

  - dimension: settlement_etransfer_paid
    type: yesno
    sql: ${TABLE}.settlement_etransfer_paid

  - dimension: settlement_payment_method_id
    type: number
    sql: ${TABLE}.settlement_payment_method_id

  - dimension: settlement_voucher_image
    type: string
    sql: ${TABLE}.settlement_voucher_image

  - dimension: source_misc_comments
    type: string
    sql: ${TABLE}.source_misc_comments

  - dimension: total_amount
    type: number
    sql: ${TABLE}.total_amount

  - dimension: total_dest_misc_charges
    type: number
    sql: ${TABLE}.total_dest_misc_charges

  - dimension: total_source_misc_charges
    type: number
    sql: ${TABLE}.total_source_misc_charges

  - dimension: unloading_charges
    type: number
    sql: ${TABLE}.unloading_charges

  - measure: count
    type: count
    drill_fields: [id]
    
  - measure: Avg_Freight
    type: avg
    sql: ${TABLE}.freight_amount + ${TABLE}.loading_charges + NULLIF(${TABLE}.unloading_charges,0) + ${TABLE}.halt_charges
    drill_fields: [order_id,base_order.user_id,base_order.start_date,base_order.end_date,base_order.status,From_City.city,To_city.city,freight_amount]

  - dimension: Fuel_Percentage
    type: number
    sql: 100*${advance_fuel_amount}/${freight_amount}
    value_format_name: decimal_2
    
  - measure: Fuel_Percentage_Count
    type: count_distinct
    sql: ${order_id}
    filters:
       Fuel_Percentage: '>40'
    drill_fields: [order_id,Fuel_Percentage]
        
    