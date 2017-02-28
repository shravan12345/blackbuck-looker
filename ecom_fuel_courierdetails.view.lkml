view: ecom_fuel_courierdetails {
  sql_table_name: zinka.ecomFuel_courierdetails ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cardrequest_id {
    type: number
    sql: ${TABLE}.cardrequest_id ;;
  }

  dimension: courier_name {
    type: string
    sql: ${TABLE}.courier_name ;;
  }

  dimension: docket_number {
    type: string
    sql: ${TABLE}.docket_number ;;
  }

  dimension_group: dt_added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added ;;
  }

  measure: count {
    type: count
    drill_fields: [id, courier_name]
  }
}
