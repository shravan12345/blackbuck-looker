- view: base_supplypartnerorders
  sql_table_name: zinka.base_supplypartnerorders
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: channel
    type: number
    sql: ${TABLE}.channel

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension: order_id
    type: number
    sql: ${TABLE}.order_id

  - dimension: supply_partner_id
    type: number
    sql: ${TABLE}.supply_partner_id

  - dimension: unblock_comment
    type: string
    sql: ${TABLE}.unblock_comment

  - dimension: unblock_reason
    type: number
    sql: ${TABLE}.unblock_reason

  - measure: count
    type: count
    drill_fields: [id]