view: base_sectortype {
  sql_table_name: zinka.base_sectortype ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: sector_name {
    type: string
    sql: ${TABLE}.sector_name ;;
  }

  dimension: business_type_id {
    type: number
    sql: ${TABLE}.business_type_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, sector_name]
  }
}
