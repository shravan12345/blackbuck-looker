- view: base_ozonetelagentprofile
  sql_table_name: zinka.base_ozonetelagentprofile
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: agent_id
    type: string
    sql: ${TABLE}.agent_id

  - dimension: agent_name
    type: string
    sql: ${TABLE}.agent_name

  - dimension: agent_user_id
    type: number
    sql: ${TABLE}.agent_user_id

  - dimension: campaign_name
    type: string
    sql: ${TABLE}.campaign_name

  - dimension: pin
    type: string
    sql: ${TABLE}.pin

  - measure: count
    type: count
    drill_fields: [id, agent_name, campaign_name]