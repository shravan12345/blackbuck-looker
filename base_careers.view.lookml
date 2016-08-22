- view: base_careers
  sql_table_name: blackbuck_prod.base_careers
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: experience
    type: string
    sql: ${TABLE}.experience

  - dimension: functional_area
    type: string
    sql: ${TABLE}.functional_area

  - dimension: job_description
    type: string
    sql: ${TABLE}.job_description

  - dimension: location
    type: string
    sql: ${TABLE}.location

  - dimension: role
    type: string
    sql: ${TABLE}.role

  - measure: count
    type: count
    drill_fields: [id]

