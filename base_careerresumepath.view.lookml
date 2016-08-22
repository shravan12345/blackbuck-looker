- view: base_careerresumepath
  sql_table_name: blackbuck_prod.base_careerresumepath
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: career_id
    type: number
    sql: ${TABLE}.career_id

  - dimension: resumelink
    type: string
    sql: ${TABLE}.resumelink

  - dimension: sent_email
    type: yesno
    sql: ${TABLE}.sent_email

  - measure: count
    type: count
    drill_fields: [id]

