view: escalation_tnt {
  derived_table: {
    sql: SELECT a.* FROM base_trucktrackstatus as a WHERE dt_added = ( SELECT MAX(b.dt_added) from base_trucktrackstatus as b where a.order_id = b.order_id) and secondary_status IS NOT NULL; ;;
  }

  dimension: secondary_status {
    type: number
    sql: ${TABLE}.secondary_status ;;
  }

  dimension: id {
    type: number
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: called_by {
    type: string
    sql: ${TABLE}.called_by ;;
  }

  dimension_group: dt_added {
    type: time
    timeframes: [time, date, week, month, hour, hour_of_day, raw, day_of_week]
    sql: ${TABLE}.dt_added ;;
  }

  dimension: called_to {
    type: string
    sql: ${TABLE}.called_to ;;
  }

  dimension: secondary_status_name {
    case: {
      when: {
        sql: ${secondary_status} = 0 ;;
        label: "Vehicle Broke"
      }

      when: {
        sql: ${secondary_status} = 1 ;;
        label: "Theft"
      }

      when: {
        sql: ${secondary_status} = 2 ;;
        label: "Accident"
      }

      when: {
        sql: ${secondary_status} = 3 ;;
        label: "Way Bill Missing"
      }

      when: {
        sql: ${secondary_status} = 4 ;;
        label: "Other Documents Missing"
      }

      when: {
        sql: ${secondary_status} = 5 ;;
        label: "Waiting for Unload"
      }

      when: {
        sql: ${secondary_status} = 6 ;;
        label: "Delayed"
      }

      when: {
        sql: ${secondary_status} = 7 ;;
        label: "Stuck at Toll"
      }

      when: {
        sql: ${secondary_status} = 8 ;;
        label: "On Track"
      }

      when: {
        sql: ${secondary_status} = 9 ;;
        label: "Not Answered"
      }

      when: {
        sql: ${secondary_status} = 99 ;;
        label: "Others"
      }
    }
  }

  measure: count {
    type: count
    drill_fields: [order_id, secondary_status_name, comments]
  }
}
