view: base_userprofile {
  sql_table_name: newbb.base_userprofile ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: auto_approve {
    type: yesno
    sql: ${TABLE}.auto_approve ;;
  }

  dimension: battery_optimization {
    type: yesno
    sql: ${TABLE}.battery_optimization ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: company_type {
    type: string
    sql: ${TABLE}.company_type ;;
  }

  dimension: contact_number {
    type: string
    sql: ${TABLE}.contact_number ;;
  }

  dimension_group: dob {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}.dob ;;
  }

  dimension: enable_mixpanel_logging {
    type: yesno
    sql: ${TABLE}.enable_mixpanel_logging ;;
  }

  dimension: home_location_id {
    type: number
    sql: ${TABLE}.home_location_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: num_of_trucks {
    type: number
    sql: ${TABLE}.num_of_trucks ;;
  }

  dimension: sex {
    type: string
    sql: ${TABLE}.sex ;;
  }

  dimension: truck_body {
    type: string
    sql: ${TABLE}.truck_body ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, company_name]
  }
}
