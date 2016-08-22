- view: base_lanequote
  sql_table_name: blackbuck_prod.base_lanequote
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: avg_rate
    type: number
    sql: ${TABLE}.avg_rate

  - dimension: created_by_id
    type: number
    sql: ${TABLE}.created_by_id

  - dimension_group: dt_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added

  - dimension_group: dt_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_updated

  - dimension: from_city_id
    type: number
    sql: ${TABLE}.from_city_id

  - dimension: is_accepted
    type: yesno
    sql: ${TABLE}.is_accepted

  - dimension: min_rate
    type: number
    sql: ${TABLE}.min_rate

  - dimension: order_comment
    type: number
    sql: ${TABLE}.order_comment

  - dimension: order_id
    type: number
    sql: ${TABLE}.order_id

  - dimension: quote_rate
    type: number
    sql: ${TABLE}.quote_rate

  - dimension: supplier_id
    type: number
    sql: ${TABLE}.supplier_id

  - dimension: to_city_id
    type: number
    sql: ${TABLE}.to_city_id

  - dimension: truck_type_id
    type: number
    sql: ${TABLE}.truck_type_id

  - measure: count
    type: count
    drill_fields: [id]

