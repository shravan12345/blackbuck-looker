view: unloading_poc {
  derived_table: {
    sql: select
bo.id as 'GB_Order_Id',
date(bo.end_date) as 'Shipment_Date',
blf.city as 'From_City',
tlf.city as 'To_City',
elu.contact_person_name as 'POC_Name',
elu.contact_person_number as 'POC_Number'
from base_order bo
join newbb.enquiry_order eo on eo.id = bo.client_handshake_order_id
left join newbb.enquiry_orderrequest eor on eo.order_request_id = eor.id
left join newbb.enquiry_loadingunloading elu on elu.order_request_id = eor.id and elu.poi_type = 2
left join base_location blf on blf.id = bo.from_city_id
left join base_location tlf on tlf.id = bo.to_city_id
where blf.city in ('Anjar','Bhuj','Mundra','Jamnagar')
and date(bo.end_date) > (current_date()-interval 20 day)
order by 2 desc ;;

    }

    dimension: GB_Order_Id  {
      type: number
      sql: ${TABLE}.GB_Order_Id ;;
    }

    dimension: Shipment_Date {
      type: date
      sql: ${TABLE}.Shipment_Date ;;
    }

    dimension: POC_Name {
      type: string
      sql:${TABLE}.POC_Name  ;;
    }

    dimension: POC_Number {
      type: number
      sql:${TABLE}.POC_Number  ;;
    }

    dimension: From_City {
      type: string
      sql:${TABLE}.From_City  ;;
    }

    dimension: To_City {
      type: string
      sql:${TABLE}.To_City  ;;
    }

  }
