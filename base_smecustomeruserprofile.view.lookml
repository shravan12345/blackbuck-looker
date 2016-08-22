- view: base_smecustomeruserprofile
  sql_table_name: blackbuck_prod.base_smecustomeruserprofile
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: customer_user_id
    type: number
    sql: ${TABLE}.customer_user_id

  - dimension: empanelment_type
    type: number
    sql: ${TABLE}.empanelment_type

  - dimension: projected_load_type
    type: number
    sql: ${TABLE}.projected_load_type

  - dimension: projected_loads
    type: number
    sql: ${TABLE}.projected_loads

  - dimension: promoter_contact
    type: string
    sql: ${TABLE}.promoter_contact

  - dimension: promoter_name
    type: string
    sql: ${TABLE}.promoter_name

  - measure: count
    type: count
    drill_fields: [id, promoter_name]

