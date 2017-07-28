view: morbi_tracking {
  derived_table: {
    sql: select bo.id as 'Order_Id',
bt.registration_number as 'Truck_Num',
date(bo.end_date) as 'Shipment_Date',
concat(ifnull(auc.first_name,"")," ",ifnull(auc.last_name,"")) as 'Consignor_Name',
concat(ifnull(aus.first_name,"")," ",ifnull(aus.last_name,"")) as 'SP_Name',
concat(ifnull(auo.first_name,"")," ",ifnull(auo.last_name,"")) as 'Owner_Name',
aus.username as 'SP_Num',
bupd.mobile1 as 'Driver_Num'
from base_order bo
left join auth_user aus on aus.id = bo.supply_partner_id
left join base_truck bt on bt.id = bo.assigned_truck_id
left join base_userprofile bupd on bupd.user_id = bo.assigned_driver_id
left join auth_user auc on auc.id = bo.user_id
left join auth_user auo on auo.id = bo.owner_id
where bo.to_sublocation_id = 1547
and bo.customer_sector_id = 7
and date(bo.end_date) >= '2017-07-25'
order by 3 desc ;;

    }

    dimension: Order_Id  {
      type: number
      sql: ${TABLE}.Order_Id ;;
    }
    dimension: Truck_Num {
      type: string
      sql: ${TABLE}.Truck_Num ;;
    }

    dimension: Shipment_Date {
      type: date
      sql: ${TABLE}.Shipment_Date ;;
    }

    dimension: Consignor_Name {
      type: string
      sql:${TABLE}.Consignor_Name  ;;
    }

    dimension: SP_Name {
      type: string
      sql:${TABLE}.SP_Name  ;;
    }

    dimension: Owner_Name {
      type: string
      sql:${TABLE}.Owner_Name  ;;
    }

    dimension: SP_Num {
      type: number
      sql:${TABLE}.SP_Num  ;;
    }

    dimension: Driver_Num {
      type: number
      sql:${TABLE}.Driver_Num  ;;
    }

  }
