view: ecom_fuel_cardtype {
  sql_table_name: zinka.ecomFuel_cardtype ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: fuel_card_provider_id {
    type: number
    sql: ${TABLE}.fuel_card_provider_id ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
