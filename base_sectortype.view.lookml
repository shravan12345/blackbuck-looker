- view: base_sectortype
  sql_table_name: zinka.base_sectortype
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: sector_name
    type: string
    sql: ${TABLE}.sector_name

  - measure: count
    type: count
    drill_fields: [id, sector_name]