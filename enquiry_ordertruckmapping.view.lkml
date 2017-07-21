view: enquiry_ordertruckmapping {
  sql_table_name: newbb.enquiry_ordertruckmapping ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cancel_reason {
    type: number
    sql: ${TABLE}.cancel_reason ;;
  }

  dimension: currently_unloading {
    type: yesno
    sql: ${TABLE}.currently_unloading ;;
  }

  dimension: driver_contact_number {
    type: string
    sql: ${TABLE}.driver_contact_number ;;
  }

  dimension: driver_name {
    type: string
    sql: ${TABLE}.driver_name ;;
  }

  dimension: empanelled_driver_id {
    type: number
    sql: ${TABLE}.empanelled_driver_id ;;
  }

  dimension_group: eta_load_point {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.eta_load_point ;;
  }

  dimension: load_kg {
    type: number
    sql: ${TABLE}.load_kg ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: remarks {
    type: string
    sql: ${TABLE}.remarks ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: tonnage {
    type: number
    sql: ${TABLE}.tonnage ;;
  }

  dimension: truck_id {
    type: number
    sql: ${TABLE}.truck_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, driver_name]
  }
}
