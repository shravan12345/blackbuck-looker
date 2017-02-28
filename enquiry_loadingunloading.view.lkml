view: enquiry_loadingunloading {
  sql_table_name: newbb.enquiry_loadingunloading ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: address_info_id {
    type: number
    sql: ${TABLE}.address_info_id ;;
  }

  dimension: contact_person_email {
    type: string
    sql: ${TABLE}.contact_person_email ;;
  }

  dimension: contact_person_name {
    type: string
    sql: ${TABLE}.contact_person_name ;;
  }

  dimension: contact_person_number {
    type: string
    sql: ${TABLE}.contact_person_number ;;
  }

  dimension_group: dt_added {
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
    sql: ${TABLE}.dt_added ;;
  }

  dimension_group: dt_updated {
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
    sql: ${TABLE}.dt_updated ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: multiple {
    type: yesno
    sql: ${TABLE}.multiple ;;
  }

  dimension: order_request_id {
    type: number
    sql: ${TABLE}.order_request_id ;;
  }

  dimension: poi_type {
    type: number
    sql: ${TABLE}.poi_type ;;
  }

  measure: count {
    type: count
    drill_fields: [id, contact_person_name]
  }
}
