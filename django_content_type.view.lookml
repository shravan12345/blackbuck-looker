- view: django_content_type
  sql_table_name: blackbuck_prod.django_content_type
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: app_label
    type: string
    sql: ${TABLE}.app_label

  - dimension: model
    type: string
    sql: ${TABLE}.model

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - measure: count
    type: count
    drill_fields: [id, name]

