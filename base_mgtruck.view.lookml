- view: base_mgtruck
  sql_table_name: blackbuck_prod.base_mgtruck
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: contract_type
    type: number
    sql: ${TABLE}.contract_type

  - dimension_group: dt_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_updated

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_date

  - dimension: imei_number_id
    type: number
    sql: ${TABLE}.imei_number_id

  - dimension: is_active
    type: yesno
    sql: ${TABLE}.is_active

  - dimension: loading_charge
    type: number
    sql: ${TABLE}.loading_charge

  - dimension: mg_amount
    type: number
    sql: ${TABLE}.mg_amount

  - dimension: mg_cost_perkm
    type: number
    sql: ${TABLE}.mg_cost_perkm

  - dimension: mg_distance
    type: number
    sql: ${TABLE}.mg_distance

  - dimension: mg_executive_id
    type: number
    sql: ${TABLE}.mg_executive_id

  - dimension: mobile_allotted
    type: yesno
    sql: ${TABLE}.mobile_allotted

  - dimension: mobile_number
    type: string
    sql: ${TABLE}.mobile_number

  - dimension: modified_by_id
    type: number
    sql: ${TABLE}.modified_by_id

  - dimension: payment_type
    type: number
    sql: ${TABLE}.payment_type

  - dimension: remark
    type: string
    sql: ${TABLE}.remark

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_date

  - dimension: start_location_id
    type: number
    sql: ${TABLE}.start_location_id

  - dimension: supply_partner_id
    type: number
    sql: ${TABLE}.supply_partner_id

  - dimension: toll
    type: yesno
    sql: ${TABLE}.toll

  - dimension: truck_id
    type: number
    sql: ${TABLE}.truck_id

  - dimension: unloading_charge
    type: number
    sql: ${TABLE}.unloading_charge

  - measure: count
    type: count
    drill_fields: [id]

