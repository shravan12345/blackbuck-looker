view: placement_tracker {
  derived_table: {
    sql: select
date(oa.dt_added) as 'Date',
bo.id as 'Order_Id',
blf.city as 'From_City', blf.state as 'From_State',
tlf.city as 'To_City', tlf.state as 'To_State',
bt.registration_number as 'Truck_Num',
concat(ifnull(aus.first_name,"")," ",ifnull(aus.last_name,"")) as 'SP_Name',
aus.username as 'SP_Number'
from base_order bo
left join base_location blf on blf.id = bo.from_city_id
left join base_location tlf on tlf.id = bo.to_city_id
left join auth_user aus on aus.id = bo.supply_partner_id
left join base_truck bt on bt.id = bo.assigned_truck_id
left join base_status oa on oa.order_id = bo.id and oa.status = 'Order Accepted'
where bo.client_order_id is not null
and date(oa.dt_added) between (current_date()-interval 1 day) and current_date()
and bo.status not in ('Cancelled By Customer','Cancelled','Order Processing','KAM Review','Ops Review','Order Incomplete')
and blf.city in ('Anjar','Bhuj','Mundra','Jodiya','Bhachau','Jamnagar') ;;

    }

    dimension: Order_Id  {
      type: number
      sql: ${TABLE}.Order_Id ;;
    }
    dimension: Truck_Num {
      type: string
      sql: ${TABLE}.Truck_Num ;;
    }

    dimension: Date {
      type: date
      sql: ${TABLE}.Date ;;
    }

    dimension: From_City {
    type: string
    sql:${TABLE}.SP_Name  ;;
    }

    dimension: From_State {
    type: string
    sql:${TABLE}.From_State  ;;
    }

    dimension: To_City {
    type: string
    sql:${TABLE}.To_City  ;;
    }

    dimension: To_State {
    type: string
    sql:${TABLE}.To_State  ;;
    }

    dimension: SP_Name {
      type: string
      sql:${TABLE}.SP_Name  ;;
    }

    dimension: SP_Num {
      type: number
      sql:${TABLE}.SP_Num  ;;
    }

}
