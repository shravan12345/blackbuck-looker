- view: base_truckclassification_related_types
  sql_table_name: zinka.base_truckclassification_related_types
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: truckclassification_id
    type: number
    sql: ${TABLE}.truckclassification_id

  - dimension: trucktype_id
    type: number
    sql: ${TABLE}.trucktype_id

  - measure: count
    type: count
    drill_fields: [id]