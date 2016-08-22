- view: base_billdiscountingorderdetails
  sql_table_name: blackbuck_prod.base_billdiscountingorderdetails
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: bill_discount_inv_url
    type: string
    sql: ${TABLE}.bill_discount_inv_url

  - dimension: bill_discounting_id
    type: number
    sql: ${TABLE}.bill_discounting_id

  - dimension: bill_num
    type: string
    sql: ${TABLE}.bill_num

  - dimension_group: invoice
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.invoice_date

  - dimension: order_id
    type: number
    sql: ${TABLE}.order_id

  - dimension: receivable
    type: number
    sql: ${TABLE}.receivable

  - measure: count
    type: count
    drill_fields: [id]

