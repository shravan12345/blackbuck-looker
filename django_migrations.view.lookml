- view: django_migrations
  sql_table_name: blackbuck_prod.django_migrations
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: app
    type: string
    sql: ${TABLE}.app

  - dimension_group: applied
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.applied

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - measure: count
    type: count
    drill_fields: [id, name]

