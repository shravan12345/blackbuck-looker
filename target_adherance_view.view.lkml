view: target_adherance_view {
  derived_table: {
    sql: SELECT
  DATE(CONVERT_TZ(base_order.end_date ,'UTC','Asia/Kolkata')) AS `end_date`,
  base_order.id  AS `id`,
  base_orderfinancedetails.freight_amount  AS `freight_amount`,
  base_order.order_value  AS `order_value`,
  (COALESCE( ( SUM(DISTINCT (CAST(FLOOR(COALESCE(dlp_laneratetargets.cft_target_rate ,0)*(1000000*1.0)) AS DECIMAL(65,0))) + (CAST(CONV(SUBSTR(MD5(dlp_laneratetargets.id ),1,16),16,10) AS DECIMAL(65)) *18446744073709551616 + CAST(CONV(SUBSTR(MD5(dlp_laneratetargets.id ), 17, 16), 16, 10) AS DECIMAL(65))) ) - SUM(DISTINCT (CAST(CONV(SUBSTR(MD5(dlp_laneratetargets.id ),1,16),16,10) AS DECIMAL(65)) *18446744073709551616 + CAST(CONV(SUBSTR(MD5(dlp_laneratetargets.id ), 17, 16), 16, 10) AS DECIMAL(65)))) )  / (1000000*1.0), 0) / NULLIF(COUNT(DISTINCT CASE WHEN  dlp_laneratetargets.cft_target_rate  IS NOT NULL THEN dlp_laneratetargets.id  ELSE NULL END), 0)) AS `Target_Rate`
FROM zinka.base_order  AS base_order
LEFT JOIN zinka.base_orderfinancedetails  AS base_orderfinancedetails ON base_order.id = base_orderfinancedetails.order_id
LEFT JOIN zinka.dlp_laneratetargets  AS dlp_laneratetargets ON base_order.from_city_id = dlp_laneratetargets.from_city_id and base_order.to_city_id = dlp_laneratetargets.to_city_id and base_order.truck_type_id = dlp_laneratetargets.truck_type_id

WHERE
  (base_order.status  NOT IN ('Cancelled By Customer', 'Cancelled', 'Accept Requested', 'KAM Review', 'Order Incomplete', 'Order Processing', 'Ops Review') OR base_order.status  IS NULL)
GROUP BY 1,2,3,4
ORDER BY DATE(CONVERT_TZ(base_order.end_date ,'UTC','Asia/Kolkata')) DESC ;;

sql_trigger_value: CURDATE() ;;
indexes: ["id"]
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension:  order_value {
    type: number
    sql: ${TABLE}.order_value ;;
  }

  dimension: Target_Rate {
    type: number
    sql: ${TABLE}.Target_Rate ;;
  }

  dimension: freight_amount {
    type: number
    sql: ${TABLE}.freight_amount ;;


  }

  dimension_group: end {
    type: time
    timeframes: [time, date, week, month, hour, hour_of_day, raw, day_of_week]
    sql: ${TABLE}.end_date ;;
  }
}
