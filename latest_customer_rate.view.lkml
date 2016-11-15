view: latest_customer_rate {
  derived_table: {
    sql: SELECT ETA1.id,ETA1.rate,ETA1.customer_id,ETA1.from_city_id,ETA1.to_city_id , ETA1.truck_type_id,ETA1.last_updated_at,ETA1.rate_type,ETA1.end_time FROM base_customermasterfrieghtrates as ETA1 where ETA1.last_updated_at = ( Select MAX(ETA2.last_updated_at) from base_customermasterfrieghtrates ETA2 where ETA1.customer_id = ETA2.customer_id and ETA1.from_city_id = ETA2.from_city_id and ETA1.to_city_id = ETA2.to_city_id and ETA1.truck_type_id = ETA2.truck_type_id) and( ETA1.end_time = (Select MAX(ETA2.end_time) from base_customermasterfrieghtrates ETA2 where ETA1.customer_id = ETA2.customer_id and ETA1.from_city_id = ETA2.from_city_id and ETA1.to_city_id = ETA2.to_city_id and ETA1.truck_type_id = ETA2.truck_type_id)   ;;
    sql_trigger_value: SELECT CURDATE() ;;
    indexes: ["id"]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id;;

    }

  dimension: rate {
    type: number
    sql: ${TABLE}.rate ;;
  }

  dimension: rate_type {
    type: number
    sql: ${TABLE}.rate_type ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: from_city_id  {
    type: number
    sql: ${TABLE}.from_city_id ;;
  }

  dimension: to_city_id {
    type: number
    sql: ${TABLE}.to_city_id ;;
  }

  dimension: truck_type_id {
    type: number
    sql: ${TABLE}.truck_type_id ;;
  }

  dimension_group: last_updated_at {
    type: time
    timeframes: [time, date, week, month, hour, hour_of_day, raw, day_of_week]
    sql: ${TABLE}.last_updated_at ;;
  }

  dimension_group: end_time {
    type: time
    timeframes: [time, date, week, month, hour, hour_of_day, raw, day_of_week]
    sql: ${TABLE}.end_time ;;
}

  }
