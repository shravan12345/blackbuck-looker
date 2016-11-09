view: repeat_sp_lane {
  derived_table: {
    sql: SELECT CAST(@rownum := @rownum + 1 AS UNSIGNED) AS prim_key, x.* FROM (SELECT a.from_city_id as from_city_id,a.to_city_id as to_city_id,b.city as from_city,K.city as to_city , CONCAT(c.first_name,'',c.last_name) as SP_Name , count(a.id) as Order_Count , (CASE WHEN count(a.id) > 1 THEN "YES" ELSE "NO" END) as Repeat_Alert from base_order as a left join base_location as b ON b.id = a.from_city_id left join base_location as K ON K.id = a.to_city_id left join auth_user as c ON c.id = a.supply_partner_id where supply_partner_id IS NOT NULL and a.end_date > NOW() - INTERVAL 7 DAY GROUP BY 1,2,3,4,5) as x, (SELECT @rownum := 0) r ;;
  }

  dimension: from_city {
    type: string
    sql: ${TABLE}.from_city ;;
  }

  dimension: to_city {
    type: string
    sql: ${TABLE}.to_city ;;
  }

  dimension: from_city_id {
    type: number
    sql: ${TABLE}.from_city_id ;;
  }

  dimension: to_city_id {
    type: number
    sql: ${TABLE}.to_city_id ;;
  }

  dimension: prim_key {
    type: number
    primary_key: yes
    sql: ${TABLE}.prim_key ;;
  }

  dimension: order_count {
    type: number
    sql: ${TABLE}.Order_Count ;;
  }

  dimension: SP_name {
    type: string
    sql: ${TABLE}.SP_Name ;;
  }

  dimension: Repeat_Index {
    type: yesno
    sql: ${TABLE}.Repeat_Alert = "YES" ;;
  }

  measure: count {
    type: count_distinct
    sql: ${SP_name} ;;

    filters: {
      field: Repeat_Index
      value: "Yes"
    }
  }

  measure: count_total {
    type: count_distinct
    sql: ${SP_name} ;;
  }
}
