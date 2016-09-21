- view: base_supplypartnerfeedback
  sql_table_name: zinka.base_supplypartnerfeedback
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: comments
    type: string
    sql: ${TABLE}.comments

  - dimension: feedback_type
    type: number
    sql: ${TABLE}.feedback_type

  - dimension: order_id
    type: number
    sql: ${TABLE}.order_id

  - dimension: rating
    type: number
    sql: ${TABLE}.rating

  - dimension: supply_partner_id
    type: number
    sql: ${TABLE}.supply_partner_id

  - measure: count
    type: count
    drill_fields: [id]