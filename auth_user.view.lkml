view: auth_user {

  sql_table_name: zinka.auth_user ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: date_joined {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_joined ;;
    hidden: yes
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
    hidden: yes
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
    hidden: yes
  }

  dimension: is_staff {
    type: yesno
    sql: ${TABLE}.is_staff ;;
    hidden: yes
  }

  dimension: is_superuser {
    type: yesno
    sql: ${TABLE}.is_superuser ;;
    hidden: yes
  }

  dimension_group: last_login {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_login ;;
    hidden: yes
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: password {
    type: string
    sql: ${TABLE}.password ;;
    hidden: yes
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: [id, username, first_name, last_name]
  }

  dimension: full_name {
    type: string
    sql: CONCAT(${first_name},'',${last_name}) ;;

  }
}
