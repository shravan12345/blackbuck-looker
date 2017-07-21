view: ecom_fuel_ccmsconfig {
  sql_table_name: zinka.ecomFuel_ccmsconfig ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: is_rechargable {
    type: yesno
    sql: ${TABLE}.is_rechargable ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.`key` ;;
  }

  dimension: max_discount {
    type: number
    sql: ${TABLE}.max_discount ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
