view: base_bank {
  sql_table_name: newbb.base_bank ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: priority {
    type: number
    sql: ${TABLE}.priority ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
