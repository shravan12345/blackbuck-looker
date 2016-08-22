- view: courier_track_courierservice
  sql_table_name: blackbuck_prod.courierTrack_courierservice
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: short_name
    type: string
    sql: ${TABLE}.short_name

  - dimension: web_url
    type: string
    sql: ${TABLE}.web_url

  - measure: count
    type: count
    drill_fields: [id, name, short_name]

