view: base_location {
  sql_table_name: zinka.base_location ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: being_used {
    type: yesno
    sql: ${TABLE}.being_used ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: district {
    type: string
    sql: ${TABLE}.district ;;
  }

  dimension: google_place_id {
    type: number
    sql: ${TABLE}.google_place_id ;;
  }

  dimension: is_from {
    type: yesno
    sql: ${TABLE}.is_from ;;
  }

  dimension: is_to {
    type: yesno
    sql: ${TABLE}.is_to ;;
  }

  dimension: new_district_id {
    type: number
    sql: ${TABLE}.new_district_id ;;
  }

  dimension: new_state_id {
    type: number
    sql: ${TABLE}.new_state_id ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: watch_enabled {
    type: yesno
    sql: ${TABLE}.watch_enabled ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
