- view: base_userprofile_preferred_lane
  sql_table_name: blackbuck_prod.base_userprofile_preferred_lane
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: lane_id
    type: number
    sql: ${TABLE}.lane_id

  - dimension: userprofile_id
    type: number
    sql: ${TABLE}.userprofile_id

  - measure: count
    type: count
    drill_fields: [id]

