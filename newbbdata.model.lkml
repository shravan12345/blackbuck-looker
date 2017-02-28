connection: "newbbdb"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: auth_group {}

explore: auth_group_permissions {}

explore: auth_permission {}

explore: auth_user {}

explore: auth_user_groups {}

explore: auth_user_user_permissions {}

explore: base_addressinfo {}

explore: base_apkversion {}

explore: base_bank {}

explore: base_bankaccount {}

explore: base_cluster {}

explore: base_clusterconfig {}

explore: base_clusterlocalityinfo {}

explore: base_documents {}

explore: base_empanelleddriver {}

explore: base_empanelleddriverdocsmapping {}

explore: base_empanelledowner {}

explore: base_empanelledownerdocsmapping {}

explore: base_fcmkey {}

explore: base_googleplaces {}

explore: base_lane {}

explore: base_localityinfo {}

explore: base_producttype {}

explore: base_role {}

explore: base_truck {}

explore: base_truckbody {}

explore: base_truckdocsmapping {}

explore: base_trucktonnage {}

explore: base_trucktype {}

explore: base_userinteractiondata {}

explore: base_userprofile {}

explore: base_userprofile_bank_account {}

explore: base_userprofile_cluster {}

explore: base_userprofile_from_location_preferences {}

explore: base_userprofile_preferred_lanes {}

explore: base_userprofile_roles {}

explore: base_userprofile_to_state_preferences {}

explore: base_userprofile_work_location {}

explore: base_uservalidation {}

explore: connection_reg_r3 {}

explore: django_admin_log {}

explore: django_content_type {}

explore: django_migrations {}

explore: django_session {}

explore: enquiry_bid {}

explore: enquiry_enquiryjourney {}

explore: enquiry_loadingunloading {}

explore: enquiry_order {}

explore: enquiry_orderbankaccountmapping {}

explore: enquiry_ordercollectionmapping {}

explore: enquiry_ordermargin {}

explore: enquiry_orderrequest {
  join: enquiry_order {
    type: left_outer
    relationship: one_to_one
    sql_on: ${enquiry_order.order_request_id} = ${enquiry_orderrequest.id} ;;
  }
  join: enquiry_ordertruckmapping {
    type: left_outer
    relationship: one_to_one
    sql_on: ${enquiry_ordertruckmapping.order_id} = ${enquiry_order.id} ;;
  }
  join: auth_user {
    type: left_outer
    relationship:one_to_many
    sql_on: ${enquiry_orderrequest.customer_id} = ${auth_user.id} ;;
  }
  join: enquiry_bid {
    type: left_outer
    relationship: many_to_one
    sql_on: ${enquiry_bid.order_request_id} = ${enquiry_orderrequest.id} ;;
  }
  join: auth_usersupplypart {
    from: auth_user
    type: left_outer
    relationship: many_to_one
    sql_on: ${auth_usersupplypart.id} = ${enquiry_bid.supply_partner_id} ;;
  }
  join: base_lane {
    type:left_outer
    relationship:many_to_one
    sql_on: ${base_lane.id} = ${enquiry_orderrequest.lane_id} ;;}
  join: base_clusterlocalityinfo_from{
    from: base_clusterlocalityinfo
    relationship: one_to_many
    sql_on: ${base_clusterlocalityinfo_from.id} = ${base_lane.from_location_id} ;;
  }
  join: base_clusterlocalityinfo_to {
    from: base_clusterlocalityinfo
    type: left_outer
    relationship: one_to_many
    sql_on: ${base_clusterlocalityinfo_to.id} = ${base_lane.to_location_id} ;;

  }
  join: base_googleplaces_from {
    from: base_googleplaces
    type: left_outer
    relationship: one_to_one
    sql_on: ${base_clusterlocalityinfo_from.city_id} = ${base_googleplaces_from.id} ;;

  }
  join: base_googleplaces_to {
    from: base_googleplaces
    type: left_outer
    relationship: one_to_one
    sql_on: ${base_clusterlocalityinfo_to.city_id} = ${base_googleplaces_to.id} ;;

  }
  join: enquiry_ordermargin {
    type: left_outer
    relationship: one_to_one
    sql_on: ${enquiry_order.id} = ${enquiry_ordermargin.order_id} ;;
  }
  join: base_truck {
    type: left_outer
    relationship: one_to_many
    sql_on: ${base_truck.id} = ${enquiry_ordertruckmapping.truck_id} ;;
  }
  join: base_trucktype {
    type: left_outer
    relationship: one_to_many
    sql_on: ${base_truck.truck_type_id} = ${base_trucktype.id};;

  }


}

explore: enquiry_ordertruckmapping {}

explore: enquiry_ordertruckmappingdocsmapping {}

explore: enquiry_ordertrucksellerpayment {}

explore: enquiry_sellerpayment {}

explore: payment_ordercollection {}

explore: payment_sellertransaction {}

explore: payment_transaction {}
