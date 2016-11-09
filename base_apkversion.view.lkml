view: base_apkversion {
  sql_table_name: zinka.base_apkversion ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: current_version {
    type: number
    sql: ${TABLE}.current_version ;;
  }

  dimension_group: dt_added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dt_added ;;
  }

  dimension: min_version {
    type: number
    sql: ${TABLE}.min_version ;;
  }

  dimension: play_store_url {
    type: string
    sql: ${TABLE}.play_store_url ;;
  }

  dimension: role_id {
    type: number
    sql: ${TABLE}.role_id ;;
  }

  dimension: s3_url {
    type: string
    sql: ${TABLE}.s3_url ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension: use_server_update {
    type: yesno
    sql: ${TABLE}.use_server_update ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
