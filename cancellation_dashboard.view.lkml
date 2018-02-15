view: cancellation_dashboard {
  derived_table: {
    sql: select distinct
(case when bup.profile_type in ('fleet_owner','transport_contractor') then 'FO' else 'Non-FO' end) as 'Profile_Type',
eor.business_type,
bo.id as 'GB_Order_Id',
sha.registration_number as 'Truck_Number',
oa.dt_added as 'Accepted_Datetime',
bo.status as 'Current_Status',
cs.dt_added as 'CurrentStatus_Datetime',
tas.dt_added as 'TAS_Datetime',
eb.supply_partner_id as 'SP_Id',
bup.name as 'SP_Name', bup.company_name as 'SP_Company_Name',
au.username as 'SP_Number',
eor.customer_id as 'Customer_Id',
bupc.name as 'Cust_Name', bupc.company_name as 'Cust_Company_Name',
auc.username as 'Cust_Number',
eor.product,
blf.city as 'From_City',
tlf.city as 'To_City', tlf.state as 'To_State',
eor.id as 'Request_Id',
eor.unit_price as 'Request_Price',
eb.unit_price as 'Handshake_Price',
eor.source as 'Request_Source', eb.source as 'Bid_Source'
from base_order bo
join newbb.enquiry_order eo on eo.id = bo.client_handshake_order_id
left join base_truck bt on bt.id = bo.assigned_truck_id
left join base_location blf on blf.id = bo.from_city_id
left join base_location tlf on tlf.id = bo.to_city_id
left join base_status oa on oa.order_id = bo.id and oa.status = 'Order Accepted'
left join base_status cs on cs.order_id = bo.id and cs.status = bo.status
left join base_status tas on tas.order_id = bo.id and tas.status = 'Truck Arrival Source'
left join base_statushistory sha on sha.order_id = bo.id and sha.status = 'Order Accepted'
left join newbb.enquiry_orderrequest eor on eo.order_request_id = eor.id
left join newbb.enquiry_bid eb on eo.bid_id = eb.id
left join newbb.base_userprofile bup on eb.supply_partner_id = bup.user_id
left join newbb.auth_user au on au.id = bup.user_id
left join newbb.base_userprofile bupc on eor.customer_id = bupc.user_id
left join newbb.auth_user auc on auc.id = bupc.user_id
where date(oa.dt_added) between '2017-12-01' and current_date()
and blf.city in ('Anjar','Bhuj','Mundra','Jamnagar')
and bo.status in ('Cancelled By Customer','Cancelled','Order Processing','KAM Review','Ops Review','Order Incomplete')
and bo.client_order_id is not null
order by 5 desc ;;

    }

    dimension: Profile_Type  {
      type: string
      sql: ${TABLE}.Profile_Type ;;
    }
    dimension: business_type {
      type: string
      sql: ${TABLE}.business_type ;;
    }

  dimension_group: Accepted_Datetime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.Accepted_Datetime ;;
  }

  dimension_group: CurrentStatus_Datetime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.CurrentStatus_Datetime ;;
  }

  dimension_group: TAS_Datetime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.TAS_Datetime ;;
  }

    dimension: GB_Order_Id {
      type: number
      sql:${TABLE}.GB_Order_Id  ;;
    }

    dimension: SP_Name {
      type: string
      sql:${TABLE}.SP_Name  ;;
    }

    dimension: Truck_Number {
      type: string
      sql:${TABLE}.Truck_Number  ;;
    }

    dimension: Current_Status {
      type: string
      sql:${TABLE}.Current_Status  ;;
    }

    dimension: SP_Id {
      type: number
      sql:${TABLE}.SP_Id  ;;
    }

  dimension: SP_Company_Name {
    type: string
    sql:${TABLE}.SP_Company_Name  ;;
  }

  dimension: SP_Number {
    type: number
    sql:${TABLE}.SP_Number  ;;
  }

  dimension: Customer_Id {
    type: number
    sql:${TABLE}.Customer_Id  ;;
  }

  dimension: Cust_Name {
    type: string
    sql:${TABLE}.Cust_Name  ;;
  }

  dimension: Cust_Company_Name {
    type: string
    sql:${TABLE}.Cust_Company_Name  ;;
  }

  dimension: Cust_Number {
    type: number
    sql:${TABLE}.Cust_Number  ;;
  }

    dimension: From_City {
      type: string
      sql:${TABLE}.From_City  ;;
    }

    dimension: To_City {
      type: string
      sql:${TABLE}.To_City  ;;
    }

  dimension: product {
    type: string
    sql:${TABLE}.product  ;;
  }

  dimension: To_State {
    type: string
    sql:${TABLE}.To_State  ;;
  }

  dimension: Request_Id {
    type: number
    sql:${TABLE}.Request_Id  ;;
  }

  dimension: Request_Price {
    type: number
    sql:${TABLE}.Request_Price  ;;
  }

  dimension: Handshake_Price {
    type: number
    sql:${TABLE}.Handshake_Price  ;;
  }

  dimension: Request_Source {
    type: string
    sql:${TABLE}.Request_Source  ;;
  }

  dimension: Bid_Source {
    type: string
    sql:${TABLE}.Bid_Source  ;;
  }

  }
