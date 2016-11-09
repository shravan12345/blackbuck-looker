view: base_truckownerprofile {
  sql_table_name: zinka.base_truckownerprofile ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: smartphone_given {
    type: yesno
    sql: ${TABLE}.smartphone_given ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
