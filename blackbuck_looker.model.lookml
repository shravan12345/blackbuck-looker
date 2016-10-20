- connection: blackbuck_realtime

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

# - explore: auth_group

# - explore: auth_group_permissions

#  - explore: auth_permission

- explore: auth_user
  label: 'Name- Database'
  joins:
   - join: base_userprofile
     type: left_outer
     relationship: one_to_one
     sql_on: ${base_userprofile.id} = ${auth_user.id}
  
  
  
# - explore: auth_user_groups

# - explore: auth_user_user_permissions

# - explore: base_adcampaigntracking

# - explore: base_adhocorderrates

# - explore: base_androidapp

# - explore: base_androidregkey

# - explore: base_androidregkey_gcm_keys

# - explore: base_apkversion

# - explore: base_auction

# - explore: base_auctionparticipant

# - explore: base_bank

# - explore: base_banner

# - explore: base_bid

# - explore: base_billdiscountingfinancier

# - explore: base_billdiscountinghistory

#  - explore: base_billdiscountingorderdetails

#  - explore: base_billdiscountingpayments

#  - explore: base_billdiscountingrepayment

#  - explore: base_bonusscheme

# - explore: base_botcalllivetrack

# - explore: base_botcallqueue

#  - explore: base_botcallsorderstotrack

#  - explore: base_botdailyorderdetails

- explore: base_botrecording

- explore: base_bottracktrace

#  - explore: base_branch

#  - explore: base_callinventory

- explore: base_cancelreason

# - explore: base_careerresumepath

# - explore: base_careers

# - explore: base_cashcard

# - explore: base_country

# - explore: base_coupon

# - explore: base_courierservice

# - explore: base_customcustomerlocation

# - explore: base_customcustomertrucktype

# - explore: base_customerdieselrelateddata

- explore: base_customerinvoice

# - explore: base_customerinvoiceinfo

# - explore: base_customerloadunloadpointsrates

# - explore: base_customermasterdetentionrates

- explore: base_customermasterdiscount

- explore: base_customermasterfrieghtrates
  label: 'Customer-Contract-Rates'
  fields: [ALL_FIELDS*,-base_order.POD_Points_Index,-base_order.Placement_24,-base_order.Transit_time,-base_order.Responsiveness_Index,-base_order.Expected_Loss_Index,-base_order.performance_index,-base_order.Actual_Transit_Time,-base_order.Avg_POD_Time,-base_order.Responsiveness_Count,-base_order.Count_TAS,-base_order.Actual_POD_Time,-base_order.count_no_show,-base_order.count_rejected,-base_order.Target_Adhered,-base_order.Avg_Transit_time,-base_order.supply_demand_ratio,-base_order.Avg_Order_Rate_2,-base_order.Avg_Order_Rate_3,-base_order.Avg_Order_Rate_4,-base_order.Avg_Order_Rate_5,-base_order.Avg_Order_Rate_6,-base_order.Avg_Order_Rate_7,-base_order.Avg_Order_Rate_mon,-base_order.Avg_Order_Rate_Today,-base_order.Avg_Order_Rate_Yesterday,-base_order.Min_Order_Rate_month,-base_order.Avg_Order_Rate_15,-base_order.start_location_1,-base_order.end_location_1,-base_order.start_location_1_latitude_max,-base_order.start_location_1_latitude_min,-base_order.start_location_1_longitude_max,-base_order.start_location_1_longitude_min,-base_order.end_location_1_latitude_max,-base_order.end_location_1_latitude_min,-base_order.end_location_1_longitude_max,-base_order.end_location_1_longitude_min,-base_order.Right_truck_count]
  joins:
   - join: base_customeruserprofile
     type: left_outer
     relationship: many_to_one
     sql_on: ${base_customermasterfrieghtrates.customer_id} = ${base_customeruserprofile.user_id}
   
   - join: From_City
     from: base_location
     relationship: many_to_one
     sql_on: ${base_customermasterfrieghtrates.from_city_id} = ${From_City.id} and ${base_order.from_city_id} = ${From_City.id}
   
   - join: To_city
     from: base_location
     relationship: many_to_one
     sql_on: ${base_customermasterfrieghtrates.to_city_id} = ${To_city.id} and ${base_order.to_city_id} = ${To_city.id}
   
   - join: base_order
     type: left_outer
     relationship:  many_to_one
     sql_on: ${base_customeruserprofile.user_id} = ${base_order.user_id}
     
   - join: base_trucktype
     type: left_outer
     relationship: many_to_one
     sql_on: ${base_customermasterfrieghtrates.truck_type_id} = ${base_trucktype.id} and ${base_order.truck_type_id} = ${base_trucktype.id} 
     
   - join: base_supplyprofile
     type: left_outer
     relationship: many_to_one
     sql_on: ${base_order.user_id} = ${base_supplyprofile.user_id}
     
   - join: auth_user
     type: left_outer
     relationship: one_to_one
     sql_on: ${base_supplyprofile.user_id} = ${auth_user.id}
     
 
     
   
     
     
   
   

# - explore: base_customermasterloadunload
# 
# - explore: base_customermasterloadunloadrates
# 
# - explore: base_customermasterraterevision
# 
# - explore: base_customermastertransittime
# 
# - explore: base_customerpriority
# 
# - explore: base_customerspecificops
# 
# - explore: base_customerspecificops_ops_users

- explore: base_customeruserprofile
  fields: [ALL_FIELDS*,-base_order.POD_Points_Index,-base_order.Placement_24,-base_order.Transit_time,-base_order.Responsiveness_Index,-base_order.performance_index,-base_order.Actual_Transit_Time,-base_order.Avg_POD_Time,-base_order.Responsiveness_Count,-base_order.Count_TAS,-base_order.sp_name,-base_order.count_by_customer,-base_order.Expected_Loss_Index,-base_order.Performance_Index,-base_order.Actual_Transit_Time,-base_order.Avg_POD_Time,-base_order.Responsiveness_Count,-base_order.Count_TAS,-base_order.sp_name,-base_order.count_by_customer,-base_order.Actual_POD_Time,-base_order.Count_Lanes,-base_order.Count_Lane_Dispersion,-base_order.count_no_show,-base_order.count_rejected,-base_order.Target_Adhered,-base_order.Avg_Transit_time,-base_order.supply_demand_ratio,-base_order.Avg_Order_Rate,-base_order.Avg_Order_Rate_2,-base_order.Avg_Order_Rate_3,-base_order.Avg_Order_Rate_4,-base_order.Avg_Order_Rate_5,-base_order.Avg_Order_Rate_6,-base_order.Avg_Order_Rate_7,-base_order.Avg_Order_Rate_mon,-base_order.Avg_Order_Rate_Today,-base_order.Avg_Order_Rate_Yesterday,-base_order.Min_Order_Rate_month,-base_order.Avg_Order_Rate_15,-base_order.start_location_1,-base_order.end_location_1,-base_order.start_location_1_latitude_max,-base_order.start_location_1_latitude_min,-base_order.start_location_1_longitude_max,-base_order.start_location_1_longitude_min,-base_order.end_location_1_latitude_max,-base_order.end_location_1_latitude_min,-base_order.end_location_1_longitude_max,-base_order.end_location_1_longitude_min,-base_order.Right_truck_count]
  joins:
   - join: base_order
     type: left_outer
     relationship: one_to_many
     sql_on: ${base_customeruserprofile.id} = ${base_order.user_id}

# - explore: base_customeruserprofile_reports_to_users
# 
# - explore: base_customerwallet
# 
# - explore: base_dailybotcallcount
# 
# - explore: base_deductions
# 
# - explore: base_deletedcustomermasterfreightrates
# 
# - explore: base_destinationmiscellaneouscharge
# 
# - explore: base_dieselhikerelatednotification

- explore: base_distance

- explore: base_district

- explore: base_driverdetailorder

- explore: base_driverprofile

# - explore: base_emailstatus
# 
# - explore: base_financeuserprofile

- explore: base_financialtransaction

# - explore: base_fintranslock
# 
# - explore: base_fleetsupplypartnerlanes
# 
# - explore: base_fssailicense
# 
# - explore: base_ftreasonmapping

- explore: base_fuelcards

- explore: base_fuelpartners

- explore: base_fuelpartnertransaction

- explore: base_fulfillmentcall

# - explore: base_gcmkey
# 
# - explore: base_gcmnotificationmessage
# 
# - explore: base_geolocation
# 
# - explore: base_googleplaces
# 
# - explore: base_hashtag
# 
# - explore: base_imei
# 
# - explore: base_imeiuser
# 
# - explore: base_impsbank
# 
# - explore: base_impserrorcode
# 
# - explore: base_impslimit
# 
# - explore: base_impstransaction
# 
# - explore: base_incentivecoupon
# 
# - explore: base_incentivelanes
# 
# - explore: base_incentivepartnerlocations
# 
# - explore: base_invoicegenerationlock
# 
# - explore: base_invoicerejectionreason
# 
# - explore: base_kookoocallinventory

- explore: base_lane

# - explore: base_lanecharacteristics
# 
# - explore: base_laneoverheads
# 
# - explore: base_lanequote
# 
# - explore: base_laneroaddetails
# 
# - explore: base_language
# 
# - explore: base_language_states
# 
# - explore: base_languagesremapping
# 
# - explore: base_latestlocation
# 
# - explore: base_leadcalldetails
# 
# - explore: base_leadsdetail
# 
# - explore: base_leadsgroup
# 
# - explore: base_leadstatus

- explore: base_location
  label: 'Location-Table'
  

# - explore: base_locationadvancelimit
# 
# - explore: base_locationprovider
# 
# - explore: base_lorryreceipt
# 
# - explore: base_manualorderrevenue
# 
# - explore: base_marketprice
# 
# - explore: base_messagesinfo
# 
# - explore: base_mgpayment
# 
# - explore: base_mgperiodicpayment
# 
# - explore: base_mgredmile
# 
# - explore: base_mgsubcontract
# 
# - explore: base_mgsubcontract_payments
# 
# - explore: base_mgsubcontracthistory
# 
# - explore: base_mgtruck
# 
# - explore: base_mgtruckcontractdetail
# 
# - explore: base_mgtruckcontractdetailhistory
# 
# - explore: base_mgtruckhistory
# 
# - explore: base_mgtruckpreferredstate
# 
# - explore: base_mgtruckrejectedcity
# 
# - explore: base_mobiledetails
# 
# - explore: base_multipleloadingpoint
# 
# - explore: base_multipleunloadingpoint
# 
# - explore: base_notifications

- explore: base_order
  label: 'View Orders'
  view_label: 'Orders'
  joins:
   
   - join: base_orderprofitability
     view_label: 'Profitability'
     type: left_outer
     relationship: one_to_one
     sql_on: ${base_order.id}=${base_orderprofitability.order_id}
     
     
     
     
   - join: base_customeruserprofile
     type: left_outer
     view_label: 'Customer'
     relationship: many_to_one
     sql_on: ${base_order.user_id}=${base_customeruserprofile.user_id}
     
   - join: From_City
     view_label: 'From City'
     from: base_location
     relationship: many_to_one
     sql_on: ${base_order.from_city_id} = ${From_City.id}
   
   - join: To_city
     from: base_location
     view_label: 'To City'
     relationship: many_to_one
     sql_on: ${base_order.to_city_id} = ${To_city.id}
   
   - join: base_trucktype
     view_label: 'Truck'
     type: left_outer
     relationship: many_to_one
     sql_on: ${base_truck.truck_type_id} = ${base_trucktype.id}
   
   - join: base_truck
     view_label: 'Truck_Name'
     type: left_outer
     relationship: many_to_one
     sql_on: ${base_order.assigned_truck_id} = ${base_truck.id}
   
  
     
   - join: auth_user
     view_label: 'User Name'
     type: left_outer 
     relationship: many_to_one
     sql_on: ${base_order.supply_partner_id} = ${auth_user.id}
     
     
   - join: base_statushistory
     type: left_outer
     relationship: one_to_many
     sql_on: ${base_order.id} = ${base_statushistory.order_id}
     
   - join: TAS
     from: base_status
     relationship: one_to_many
     sql_on: ${base_order.id} = ${TAS.order_id} and ${TAS.status} = "Truck Arrival Source"
     
   - join: TAD
     from: base_status
     relationship: one_to_many
     sql_on: ${base_order.id} = ${TAD.order_id} and ${TAD.status} = "Truck Arrival Destination"
     
   - join: POD_Sub
     from: base_status
     relationship: one_to_many
     sql_on: ${base_order.id} = ${POD_Sub.order_id} and ${POD_Sub.status} = "Docs Received"
     
   - join: TDS
     from: base_status
     relationship: one_to_many
     sql_on: ${base_order.id} = ${TDS.order_id} and ${TDS.status} = "Payment Done"
     
   - join: base_orderdynamicprice
     type: left_outer
     relationship: one_to_one
     sql_on: ${base_orderdynamicprice.order_id} = ${base_order.id}
  
   - join: base_status
     type: left_outer
     relationship: one_to_many
     sql_on: ${base_order.id} = ${base_status.order_id}
     
   - join: base_orderinvoicerelatedinfo
     type: left_outer
     relationship: one_to_one
     sql_on: ${base_order.id} = ${base_orderinvoicerelatedinfo.order_id}
     
   - join: base_orderfinancedetails
     type: left_outer
     relationship: one_to_one
     sql_on: ${base_order.id} = ${base_orderfinancedetails.order_id}
  
   - join: dlp_laneratetargets
     type: left_outer
     relationship: many_to_one
     sql_on: ${base_order.from_city_id} = ${dlp_laneratetargets.from_city_id} and ${base_order.to_city_id} = ${dlp_laneratetargets.to_city_id} and ${base_order.truck_type_id} = ${dlp_laneratetargets.truck_type_id}
   
     
   - join: base_financialtransaction
     type: left_outer
     relationship: many_to_one
     sql_on: ${base_financialtransaction.order_id} = ${base_order.id}
     
   - join: base_fuelcards
     type: left_outer
     relationship: many_to_one
     sql_on: ${base_fuelcards.card_number} = ${base_financialtransaction.beneficiary_acc_num}
     
   - join: base_fuelpartnertransaction
     type: left_outer
     relationship: one_to_one
     sql_on: ${base_fuelpartnertransaction.fin_transaction_id} = ${base_financialtransaction.id}  
     
   - join: supply_breath_calc
     type: left_outer
     relationship: many_to_many
     sql_on: ${From_City.id} = ${supply_breath_calc.city_id}
     
   - join: base_zone_states
     type: left_outer
     relationship: one_to_many
     sql_on:  ${From_City.new_state_id} = ${base_zone_states.state_id}
     
   - join: base_zone
     type: left_outer
     relationship: many_to_one
     sql_on: ${base_zone_states.zone_id} = ${base_zone.id}
     
   - join: base_podspercourier
     type: left_outer
     relationship: many_to_many
     sql_on: ${base_podspercourier.last_modified_by_id} = ${base_order.user_id}
     
   - join: repeat_sp
     type: left_outer
     relationship: many_to_many
     sql_on: ${repeat_sp.city_id} = ${base_order.from_city_id}
     
   - join: base_userprofile
     type: left_outer
     relationship: many_to_one
     sql_on: ${base_userprofile.user_id} = ${base_order.user_id}
     
     
   - join: base_sectortype
     type: left_outer
     relationship: many_to_one
     sql_on: ${base_customeruserprofile.sector_type_id} = ${base_sectortype.id}
  
   - join: From_City_Coordinates
     from: base_googleplaces
     type: left_outer
     relationship: one_to_one
     sql_on: ${From_City.google_place_id} = ${From_City_Coordinates.id}
     
   - join: To_City_Coordinates
     from: base_googleplaces
     type: left_outer
     relationship: one_to_one
     sql_on: ${To_city.google_place_id} = ${To_City_Coordinates.id}
     
     
   
     
   
     
     
     
     
    

# - explore: base_order_freight_bill_number
# 
# - explore: base_ordercalllock

- explore: base_ordercreationinfo

# - explore: base_orderdestinations
# 
# - explore: base_orderdocument
# 
# - explore: base_orderdocumentstatus

- explore: base_orderdynamicprice
  label: 'Target_Rates Table'
  fields: [ALL_FIELDS*,-base_order.POD_Points_Index,-base_order.Placement_24,-base_order.Transit_time,-base_order.Responsiveness_Index,-base_order.performance_index,-base_order.Actual_Transit_Time,-base_order.Avg_POD_Time,-base_order.Responsiveness_Count,-base_order.Count_TAS,-base_order.sp_name,-base_order.count_by_customer,-base_order.Expected_Loss_Index,-base_order.Performance_Index,-base_order.Actual_Transit_Time,-base_order.Avg_POD_Time,-base_order.Responsiveness_Count,-base_order.Count_TAS,-base_order.sp_name,-base_order.count_by_customer,-base_order.Actual_POD_Time,-base_order.Count_Lanes,-base_order.Count_Lane_Dispersion,-base_order.count_no_show,-base_order.count_rejected,-base_order.Target_Adhered,-base_order.Avg_Transit_time,-base_order.supply_demand_ratio,-base_order.Avg_Order_Rate,-base_order.Avg_Order_Rate_2,-base_order.Avg_Order_Rate_3,-base_order.Avg_Order_Rate_4,-base_order.Avg_Order_Rate_5,-base_order.Avg_Order_Rate_6,-base_order.Avg_Order_Rate_7,-base_order.Avg_Order_Rate_mon,-base_order.Avg_Order_Rate_Today,-base_order.Avg_Order_Rate_Yesterday,-base_order.Min_Order_Rate_month,-base_order.Avg_Order_Rate_15,-base_order.start_location_1,-base_order.end_location_1,-base_order.start_location_1_latitude_max,-base_order.start_location_1_latitude_min,-base_order.start_location_1_longitude_max,-base_order.start_location_1_longitude_min,-base_order.end_location_1_latitude_max,-base_order.end_location_1_latitude_min,-base_order.end_location_1_longitude_max,-base_order.end_location_1_longitude_min,-base_order.Right_truck_count]
  joins:
     - join: base_order
       type: left_outer
       relationship: one_to_one
       sql_on: ${base_orderdynamicprice.order_id} = ${base_order.id}
     

- explore: base_orderdynamicpricestatus

- explore: base_orderdynamicpricewatcher

- explore: base_orderdynamicpricewatcherstatus

- explore: base_orderfinancedetails
  fields: [ALL_FIELDS*,-base_order.POD_Points_Index,-base_order.Placement_24,-base_order.Transit_time,-base_order.Responsiveness_Index,-base_order.performance_index,-base_order.Actual_Transit_Time,-base_order.Avg_POD_Time,-base_order.Responsiveness_Count,-base_order.Count_TAS,-base_order.sp_name,-base_order.count_by_customer,-base_order.Expected_Loss_Index,-base_order.Performance_Index,-base_order.Actual_Transit_Time,-base_order.Avg_POD_Time,-base_order.Responsiveness_Count,-base_order.Count_TAS,-base_order.sp_name,-base_order.count_by_customer,-base_order.Actual_POD_Time,-base_order.Count_Lanes,-base_order.Count_Lane_Dispersion,-base_order.count_no_show,-base_order.count_rejected,-base_order.Target_Adhered,-base_order.Avg_Transit_time,-base_order.supply_demand_ratio,-base_order.start_location_1,-base_order.end_location_1,-base_order.start_location_1_latitude_max,-base_order.start_location_1_latitude_min,-base_order.start_location_1_longitude_max,-base_order.start_location_1_longitude_min,-base_order.end_location_1_latitude_max,-base_order.end_location_1_latitude_min,-base_order.end_location_1_longitude_max,-base_order.end_location_1_longitude_min,-base_order.Right_truck_count]
  joins:
     - join: base_order
       type: left_outer
       relationship: one_to_one
       sql_on: ${base_orderfinancedetails.order_id} = ${base_order.id}


- explore: base_orderinvoicerelatedinfo
  fields: [ALL_FIELDS*,-base_orderinvoicerelatedinfo.Performance_Index]

- explore: base_orderinvoicestatus

# - explore: base_orderpaneltypayment
# 
# - explore: base_orderpaneltystatus
# 
# - explore: base_orderpaymentadvise

- explore: base_orderprofitability
  fields: [ALL_FIELDS*,-base_order.POD_Points_Index,-base_order.Placement_24,-base_order.Transit_time,-base_order.Responsiveness_Index,-base_order.Expected_Loss_Index,-base_order.performance_index,-base_order.Actual_Transit_Time,-base_order.Avg_POD_Time,-base_order.Responsiveness_Count,-base_order.Count_TAS,-base_order.sp_name,-base_order.count_by_customer,-base_order.Actual_POD_Time,-base_order.Count_Lanes,-base_order.Count_Lane_Dispersion,-base_order.count_no_show,-base_order.count_rejected,-base_order.Target_Adhered,-base_order.Avg_Transit_time,-base_order.supply_demand_ratio,-base_order.Avg_Order_Rate,-base_order.Avg_Order_Rate_2,-base_order.Avg_Order_Rate_3,-base_order.Avg_Order_Rate_4,-base_order.Avg_Order_Rate_5,-base_order.Avg_Order_Rate_6,-base_order.Avg_Order_Rate_7,-base_order.Avg_Order_Rate_mon,-base_order.Avg_Order_Rate_Today,-base_order.Avg_Order_Rate_Yesterday,-base_order.Min_Order_Rate_month,-base_order.Avg_Order_Rate_15,-base_order.start_location_1,-base_order.end_location_1,-base_order.start_location_1_latitude_max,-base_order.start_location_1_latitude_min,-base_order.start_location_1_longitude_max,-base_order.start_location_1_longitude_min,-base_order.end_location_1_latitude_max,-base_order.end_location_1_latitude_min,-base_order.end_location_1_longitude_max,-base_order.end_location_1_longitude_min,-base_order.Right_truck_count]
  joins:
   - join: base_order
     type: left_outer
     relationship: one_to_one
     sql_on: ${base_orderprofitability.order_id} = ${base_order.id}
   - join: From_City
     from: base_location
     type: left_outer
     relationship: many_to_one
     sql_on: ${base_order.from_city_id} = ${From_City.id}
   - join: To_City
     from: base_location
     type: left_outer
     relationship: many_to_one
     sql_on: ${base_order.from_city_id} = ${To_City.id}
  

- explore: base_orderreceivable

- explore: base_orderrequest

# - explore: base_ordertracking
# 
# - explore: base_orderunblockpenalty
# 
# - explore: base_orderupload
# 
# - explore: base_otpvalidation
# 
# - explore: base_ownerfeedback
# 
# - explore: base_ownerfeedback_states
# 
# - explore: base_ozonetelagentprofile

- explore: base_payment

- explore: base_paymentadvice

- explore: base_paymentadviceerrors

- explore: base_paymentdetails

- explore: base_paymentmethod

- explore: base_payments

- explore: base_placementdata

- explore: base_podspercourier
  joins:
     - join: auth_user
       type: left_outer
       relationship: many_to_one
       sql_on: ${base_podspercourier.last_modified_by_id} = ${auth_user.id}

# 
# - explore: base_product
# 
# - explore: base_receivablepayment
# 
# - explore: base_relationmanager
# 
# - explore: base_reportssubscription
# 
# - explore: base_reportssubscription_user

- explore: base_role

- explore: base_sectortype

# - explore: base_servicetax
# 
# - explore: base_smecustomeruserprofile
# 
# - explore: base_smerateenquiry
# 
# - explore: base_smerateenquiry_order
# 
# - explore: base_smerateenquirystatus
# 
# - explore: base_smsmessagetemplate
# 
# - explore: base_smsproviders
# 
# - explore: base_smsstatus
# 
# - explore: base_sourcemiscellaneouscharge
# 
# - explore: base_sreprofile

- explore: base_state

- explore: base_status
  fields: [ALL_FIELDS*,-base_status.Count_24,-base_status.PI_24,-base_status.Count_48,-base_status.PI_48]
  joins:
   - join: base_userprofile_role
     type: left_outer
     relationship: many_to_one
     sql_on: ${base_userprofile_role.userprofile_id} = ${base_userprofile.id}
   - join: base_role
     type: left_outer
     relationship: many_to_one
     sql_on: ${base_userprofile_role.role_id} = ${base_role.id}
   - join: auth_user
     type: left_outer
     relationship: many_to_one
     sql_on: ${base_status.last_modified_by_id} = ${auth_user.id}
   - join: base_userprofile
     type: left_outer
     relationship: one_to_one
     sql_on: ${base_userprofile.user_id} = ${auth_user.id}
  

     
   
   


- explore: base_statushistory
  joins:
   - join: base_userprofile_role
     type: left_outer
     relationship: many_to_one
     sql_on: ${base_userprofile_role.userprofile_id} = ${base_userprofile.id}
   - join: base_role
     type: left_outer
     relationship: many_to_one
     sql_on: ${base_userprofile_role.role_id} = ${base_role.id}
   - join: auth_user
     type: left_outer
     relationship: many_to_one
     sql_on: ${base_statushistory.last_modified_by_id} = ${auth_user.id}
   - join: base_userprofile
     type: left_outer
     relationship: one_to_one
     sql_on: ${base_userprofile.user_id} = ${auth_user.id}
  

# - explore: base_statustransitionexpirytime
# 
# - explore: base_statustransitionreasons
# 
# - explore: base_statustransitiontype
# 
# - explore: base_statustransitiontypemap

- explore: base_sublocation

# - explore: base_supplyassociatedoes
# 
# - explore: base_supplybankaccounts
# 
# - explore: base_supplybankaccountshistory
# 
# - explore: base_supplypartnerfeedback
# 
# - explore: base_supplypartnerorders
# 
# - explore: base_supplyprofile
#   joins:
#    - join: auth_user
#      type: left_outer
#      relationship: one_to_one
#      sql_on: ${base_supplyprofile.id} = ${auth_user.id}
#     
# 
# - explore: base_supplyprofilehistory
# 
# - explore: base_tallyorderjournalcomponent
# 
# - explore: base_tallyorderledger
# 
# - explore: base_tallypayment

- explore: base_team

- explore: base_tolldetails

- explore: base_tolldetails_toll_charges

# - explore: base_tollrate
# 
# - explore: base_tonnage
# 
# - explore: base_transitiongcm

- explore: base_truck
  fields: [ALL_FIELDS*,-base_order.POD_Points_Index,-base_order.Placement_24,-base_order.Transit_time,-base_order.Responsiveness_Index,-base_order.performance_index,-base_order.Actual_Transit_Time,-base_order.Avg_POD_Time,-base_order.Responsiveness_Count,-base_order.Count_TAS,-base_order.sp_name,-base_order.count_by_customer,-base_order.Expected_Loss_Index,-base_order.Performance_Index,-base_order.Actual_Transit_Time,-base_order.Avg_POD_Time,-base_order.Responsiveness_Count,-base_order.Count_TAS,-base_order.sp_name,-base_order.count_by_customer,-base_order.Actual_POD_Time,-base_order.Count_Lanes,-base_order.Count_Lane_Dispersion,-base_order.count_no_show,-base_order.count_rejected,-base_order.Target_Adhered,-base_order.Avg_Transit_time,-base_order.supply_demand_ratio,-base_order.start_location_1,-base_order.end_location_1,-base_order.start_location_1_latitude_max,-base_order.start_location_1_latitude_min,-base_order.start_location_1_longitude_max,-base_order.start_location_1_longitude_min,-base_order.end_location_1_latitude_max,-base_order.end_location_1_latitude_min,-base_order.end_location_1_longitude_max,-base_order.end_location_1_longitude_min]
  joins:
  -  join: base_trucktype
     type: left_outer
     relationship: many_to_one
     sql_on: ${base_truck.truck_type_id} = ${base_trucktype.id}
     
  -  join: From_City
     from: base_location
     type: left_outer
     relationship: many_to_one
     sql_on: ${base_truck.home_location_id} = ${From_City.id}
  -  join: base_order
     type: left_outer
     relationship: one_to_many
     sql_on: ${base_truck.id} = ${base_order.assigned_truck_id}
  -  join: auth_user
     type: left_outer
     relationship: one_to_one
     sql_on: ${base_truck.owner_id} = ${auth_user.id}
  -  join: base_userprofile
     type: left_outer
     relationship: one_to_one
     sql_on: ${base_userprofile.id} = ${auth_user.id}
  -  join: base_orderfinancedetails
     type: left_outer
     relationship: one_to_one
     sql_on: ${base_order.id} = ${base_orderfinancedetails.order_id}
     
  

# - explore: base_truck_ignore_product
# 
# - explore: base_truck_preferred_lane
# 
# - explore: base_truck_preferred_location
# 
# - explore: base_truck_preferred_product
# 
# - explore: base_truck_preferred_state

- explore: base_truckclassification

- explore: base_truckclassification_related_types

- explore: base_truckdocuments

# - explore: base_truckfinancedetails
# 
# - explore: base_trucklanerate
# 
# - explore: base_trucklocation
# 
# - explore: base_truckmanager
# 
# - explore: base_truckownerprofile
# 
# - explore: base_truckownerreferral
# 
# - explore: base_truckpreferredlocation
# 
# - explore: base_trucktrack
# 
# - explore: base_trucktrackingdevice
# 
# - explore: base_trucktrackstatus
# 
# - explore: base_trucktransitremarks

- explore: base_trucktype

# - explore: base_trucktype_tonnage
# 
# - explore: base_trucktypepenaltymap
# 
# - explore: base_truckvicinitynotification

# - explore: base_userextensionnumber
# 
# - explore: base_userinfo
# 
# - explore: base_userlanguagemap

- explore: base_userprofile

# - explore: base_userprofile_home_location
# 
# - explore: base_userprofile_ignore_product
# 
# - explore: base_userprofile_operating_zones
# 
# - explore: base_userprofile_preferred_lane
# 
# - explore: base_userprofile_preferred_location
# 
# - explore: base_userprofile_preferred_product

- explore: base_userprofile_role

- explore: base_verifiedbeneficiary

- explore: base_warehouse

# - explore: base_warehouse_supported_truck_types
# 
# - explore: base_warehouselane
# 
# - explore: base_warehouselane_tolls
# 
# - explore: base_warehouselanestate
# 
# - explore: base_zone
# 
# - explore: base_zone_states
# 
# - explore: bbauth_usersignup
# 
# - explore: bbauth_uservalidation
# 
# - explore: bbauth_uservalidationstatushistory
# 
# - explore: courier_track_courierservice
# 
# - explore: courier_track_envelopeinfo
# 
# - explore: courier_track_envelopeinfohistory
# 
# - explore: courier_track_envelopeinvoiceinfo
# 
# - explore: django_admin_log
# 
# - explore: django_content_type
# 
# - explore: django_migrations
# 
# - explore: django_session
# 
# - explore: dlp_dateratedelta
# 
# - explore: dlp_includedrates
# 
# - explore: dlp_includedrateshistory
# 
# - explore: dlp_laneratetargets
# 
# - explore: dlp_laneratetargetsstatus
# 
# - explore: dlp_productratedelta
# 
# - explore: dlp_productratedeltahistory
# 
# - explore: external_apiauthentication
# 
# - explore: mailer_dontsendentry
# 
# - explore: mailer_message
# 
# - explore: mailer_messagelog
# 
# - explore: pricing_corprfqcomments
# 
# - explore: pricing_corprfqenquires
# 
# - explore: pricing_corprfqenquiresnew
# 
# - explore: pricing_corprfqfileshistory
# 
# - explore: pricing_corprfqstatushistory
# 
# - explore: pricing_customerlanerate
# 
# - explore: pricing_fromcitygreaterthanlimit
# 
# - explore: pricing_fromcitylesserthanlimit
# 
# - explore: pricing_getbidraterequest
# 
# - explore: pricing_laneratefiles
# 
# - explore: pricing_manualentryrate
# 
# - explore: pricing_researchedlanerate
# 
# - explore: pricing_statecoeffgreaterthanlimit
# 
# - explore: pricing_statesinlane
# 
# - explore: pricing_statesinlane_states
# 
# - explore: pricing_submittedratehistory
# 
# - explore: pricing_tocitygreaterthanlimit
# 
# - explore: pricing_tocitylesserthanlimit

- explore: base_orderetahistory
  
- explore: base_ordereta
  fields: [ALL_FIELDS*,-base_order.POD_Points_Index,-base_order.Placement_24,-base_order.Transit_time,-base_order.Responsiveness_Index,-base_order.performance_index,-base_order.Actual_Transit_Time,-base_order.Avg_POD_Time,-base_order.Responsiveness_Count,-base_order.Count_TAS,-base_order.sp_name,-base_order.count_by_customer,-base_order.Expected_Loss_Index,-base_order.Performance_Index,-base_order.Actual_Transit_Time,-base_order.Avg_POD_Time,-base_order.Responsiveness_Count,-base_order.Count_TAS,-base_order.sp_name,-base_order.count_by_customer,-base_order.Actual_POD_Time,-base_order.Count_Lanes,-base_order.Count_Lane_Dispersion,-base_order.count_no_show,-base_order.count_rejected,-base_order.Target_Adhered,-base_order.Avg_Transit_time,-base_order.supply_demand_ratio,-base_order.Avg_Order_Rate,-base_order.Avg_Order_Rate_2,-base_order.Avg_Order_Rate_3,-base_order.Avg_Order_Rate_4,-base_order.Avg_Order_Rate_5,-base_order.Avg_Order_Rate_6,-base_order.Avg_Order_Rate_7,-base_order.Avg_Order_Rate_mon,-base_order.Avg_Order_Rate_Today,-base_order.Avg_Order_Rate_Yesterday,-base_order.Min_Order_Rate_month,-base_order.Avg_Order_Rate_15,-base_order.start_location_1,-base_order.end_location_1,-base_order.start_location_1_latitude_max,-base_order.start_location_1_latitude_min,-base_order.start_location_1_longitude_max,-base_order.start_location_1_longitude_min,-base_order.end_location_1_latitude_max,-base_order.end_location_1_latitude_min,-base_order.end_location_1_longitude_max,-base_order.end_location_1_longitude_min,-base_order.Right_truck_count]
  joins:
     - join: base_orderetahistory
       type: left_outer
       relationship: one_to_many
       sql_on: ${base_ordereta.order_id} = ${base_orderetahistory.order_id}
     - join: eta_revised_view
       type: left_outer
       relationship: one_to_one
       sql_on: ${base_ordereta.order_id} = ${eta_revised_view.order_id}
     - join: base_order
       type: left_outer
       relationship: one_to_one
       sql_on: ${base_ordereta.order_id} = ${base_order.id}
     - join: From_City
       view_label: 'From City'
       from: base_location
       relationship: many_to_one
       sql_on: ${base_order.from_city_id} = ${From_City.id}
   
     - join: To_city
       from: base_location
       view_label: 'To City'
       relationship: many_to_one
       sql_on: ${base_order.to_city_id} = ${To_city.id}
       
     - join: base_customeruserprofile
       type: left_outer
       view_label: 'Customer'
       relationship: many_to_one
       sql_on: ${base_order.user_id}=${base_customeruserprofile.user_id}
       
     - join: TAD
       from: base_status
       type: left_outer
       relationship: one_to_many
       sql_on: ${base_ordereta.order_id} = ${TAD.order_id} and  ${TAD.status} = "Truck Arrival Destination" 
     
     
- explore: eta_revised_view
  fields: [ALL_FIELDS*,-base_ordereta.deviation,-TAD.PI_24,-TAD.PI_48,-base_order.POD_Points_Index,-base_order.Placement_24,-base_order.Transit_time,-base_order.Responsiveness_Index,-base_order.performance_index,-base_order.Actual_Transit_Time,-base_order.Avg_POD_Time,-base_order.Responsiveness_Count,-base_order.Count_TAS,-base_order.sp_name,-base_order.count_by_customer,-base_order.Expected_Loss_Index,-base_order.Performance_Index,-base_order.Actual_Transit_Time,-base_order.Avg_POD_Time,-base_order.Responsiveness_Count,-base_order.Count_TAS,-base_order.sp_name,-base_order.count_by_customer,-base_order.Actual_POD_Time,-base_order.Count_Lanes,-base_order.Count_Lane_Dispersion,-base_order.count_no_show,-base_order.count_rejected,-base_order.Target_Adhered,-base_order.Avg_Transit_time,-base_order.supply_demand_ratio,-base_order.Avg_Order_Rate,-base_order.Avg_Order_Rate_2,-base_order.Avg_Order_Rate_3,-base_order.Avg_Order_Rate_4,-base_order.Avg_Order_Rate_5,-base_order.Avg_Order_Rate_6,-base_order.Avg_Order_Rate_7,-base_order.Avg_Order_Rate_mon,-base_order.Avg_Order_Rate_Today,-base_order.Avg_Order_Rate_Yesterday,-base_order.Min_Order_Rate_month,-base_order.Avg_Order_Rate_15,-base_order.start_location_1,-base_order.end_location_1,-base_order.start_location_1_latitude_max,-base_order.start_location_1_latitude_min,-base_order.start_location_1_longitude_max,-base_order.start_location_1_longitude_min,-base_order.end_location_1_latitude_max,-base_order.end_location_1_latitude_min,-base_order.end_location_1_longitude_max,-base_order.end_location_1_longitude_min,-base_order.Right_truck_count]
  joins: 
     - join: base_ordereta
       type: left_outer
       relationship: one_to_one
       sql_on: ${base_ordereta.order_id} = ${eta_revised_view.order_id}
     
     - join: TAD
       from: base_status
       type: left_outer
       relationship: one_to_many
       sql_on: ${eta_revised_view.order_id} = ${TAD.order_id} and  ${TAD.status} = "Truck Arrival Destination" 
       
     - join: base_order
       type: left_outer
       relationship: one_to_one
       sql_on: ${eta_revised_view.order_id} = ${base_order.id}
       
       
- explore: supply_breath_calc
  fields: [ALL_FIELDS*,-base_order.POD_Points_Index,-base_order.Placement_24,-base_order.Transit_time,-base_order.Responsiveness_Index,-base_order.performance_index,-base_order.Actual_Transit_Time,-base_order.Avg_POD_Time,-base_order.Responsiveness_Count,-base_order.Count_TAS,-base_order.sp_name,-base_order.count_by_customer,-base_order.Expected_Loss_Index,-base_order.Performance_Index,-base_order.Actual_Transit_Time,-base_order.Avg_POD_Time,-base_order.Responsiveness_Count,-base_order.Count_TAS,-base_order.sp_name,-base_order.count_by_customer,-base_order.Actual_POD_Time,-base_order.Count_Lanes,-base_order.Count_Lane_Dispersion,-base_order.count_no_show,-base_order.count_rejected,-base_order.Target_Adhered,-base_order.Avg_Transit_time,-base_order.supply_demand_ratio,-base_order.Avg_Order_Rate,-base_order.Avg_Order_Rate_2,-base_order.Avg_Order_Rate_3,-base_order.Avg_Order_Rate_4,-base_order.Avg_Order_Rate_5,-base_order.Avg_Order_Rate_6,-base_order.Avg_Order_Rate_7,-base_order.Avg_Order_Rate_mon,-base_order.Avg_Order_Rate_Today,-base_order.Avg_Order_Rate_Yesterday,-base_order.Min_Order_Rate_month,-base_order.Avg_Order_Rate_15,-base_order.start_location_1,-base_order.end_location_1,-base_order.start_location_1_latitude_max,-base_order.start_location_1_latitude_min,-base_order.start_location_1_longitude_max,-base_order.start_location_1_longitude_min,-base_order.end_location_1_latitude_max,-base_order.end_location_1_latitude_min,-base_order.end_location_1_longitude_max,-base_order.end_location_1_longitude_min,-base_order.Right_truck_count]
  joins:
   
   - join: supply_breadth_calc_30
     type: left_outer
     relationship: many_to_many
     sql_on: ${supply_breath_calc.city_id}=${supply_breadth_calc_30.city_id}
     
   - join: supply_breadth_calc_90
     type: left_outer
     relationship: many_to_many
     sql_on: ${supply_breath_calc.city_id}=${supply_breadth_calc_90.city_id}
     
     
   - join: repeat_sp
     type: left_outer
     relationship: many_to_many
     sql_on: ${supply_breath_calc.city_id}=${repeat_sp.city_id}
   
   - join: base_order
     type: left_outer
     relationship: many_to_many
     sql_on: ${supply_breath_calc.city_id} = ${base_order.from_city_id}
  

- explore: supply_breadth_calc_30
- explore: supply_breadth_calc_90
- explore: repeat_sp
- explore: escalation_tnt
  fields: [ALL_FIELDS*,-base_order.POD_Points_Index,-base_order.Placement_24,-base_order.Transit_time,-base_order.Responsiveness_Index,-base_order.performance_index,-base_order.Actual_Transit_Time,-base_order.Avg_POD_Time,-base_order.Responsiveness_Count,-base_order.Count_TAS,-base_order.sp_name,-base_order.count_by_customer,-base_order.Expected_Loss_Index,-base_order.Performance_Index,-base_order.Actual_Transit_Time,-base_order.Avg_POD_Time,-base_order.Responsiveness_Count,-base_order.Count_TAS,-base_order.sp_name,-base_order.count_by_customer,-base_order.Actual_POD_Time,-base_order.Count_Lanes,-base_order.Count_Lane_Dispersion,-base_order.count_no_show,-base_order.count_rejected,-base_order.Target_Adhered,-base_order.Avg_Transit_time,-base_order.supply_demand_ratio,-base_order.Avg_Order_Rate,-base_order.Avg_Order_Rate_2,-base_order.Avg_Order_Rate_3,-base_order.Avg_Order_Rate_4,-base_order.Avg_Order_Rate_5,-base_order.Avg_Order_Rate_6,-base_order.Avg_Order_Rate_7,-base_order.Avg_Order_Rate_mon,-base_order.Avg_Order_Rate_Today,-base_order.Avg_Order_Rate_Yesterday,-base_order.Min_Order_Rate_month,-base_order.Avg_Order_Rate_15,-base_order.start_location_1,-base_order.end_location_1,-base_order.start_location_1_latitude_max,-base_order.start_location_1_latitude_min,-base_order.start_location_1_longitude_max,-base_order.start_location_1_longitude_min,-base_order.end_location_1_latitude_max,-base_order.end_location_1_latitude_min,-base_order.end_location_1_longitude_max,-base_order.end_location_1_longitude_min,-base_order.Right_truck_count]
  joins:
   
   - join: base_order
     type: left_outer
     relationship: one_to_one
     sql_on: ${escalation_tnt.order_id}=${base_order.id}
     
   - join: base_customeruserprofile
     type: left_outer
     view_label: 'Customer'
     relationship: many_to_one
     sql_on: ${base_order.user_id}=${base_customeruserprofile.user_id}
     
   - join: From_City
     view_label: 'From City'
     from: base_location
     relationship: many_to_one
     sql_on: ${base_order.from_city_id} = ${From_City.id}
     
- explore: supply_breath_lane_calc
  fields: [ALL_FIELDS*,-base_order.POD_Points_Index,-base_order.Placement_24,-base_order.Transit_time,-base_order.Responsiveness_Index,-base_order.performance_index,-base_order.Actual_Transit_Time,-base_order.Avg_POD_Time,-base_order.Responsiveness_Count,-base_order.Count_TAS,-base_order.sp_name,-base_order.count_by_customer,-base_order.Expected_Loss_Index,-base_order.Performance_Index,-base_order.Actual_Transit_Time,-base_order.Avg_POD_Time,-base_order.Responsiveness_Count,-base_order.Count_TAS,-base_order.sp_name,-base_order.count_by_customer,-base_order.Actual_POD_Time,-base_order.Count_Lanes,-base_order.Count_Lane_Dispersion,-base_order.count_no_show,-base_order.count_rejected,-base_order.Target_Adhered,-base_order.Avg_Transit_time,-base_order.supply_demand_ratio,-base_order.Avg_Order_Rate,-base_order.Avg_Order_Rate_2,-base_order.Avg_Order_Rate_3,-base_order.Avg_Order_Rate_4,-base_order.Avg_Order_Rate_5,-base_order.Avg_Order_Rate_6,-base_order.Avg_Order_Rate_7,-base_order.Avg_Order_Rate_mon,-base_order.Avg_Order_Rate_Today,-base_order.Avg_Order_Rate_Yesterday,-base_order.Min_Order_Rate_month,-base_order.Avg_Order_Rate_15,-base_order.start_location_1,-base_order.end_location_1,-base_order.start_location_1_latitude_max,-base_order.start_location_1_latitude_min,-base_order.start_location_1_longitude_max,-base_order.start_location_1_longitude_min,-base_order.end_location_1_latitude_max,-base_order.end_location_1_latitude_min,-base_order.end_location_1_longitude_max,-base_order.end_location_1_longitude_min,-base_order.Right_truck_count]
  joins:
  
     
   - join: repeat_sp_lane
     type: left_outer
     relationship: many_to_many
     sql_on: ${supply_breath_lane_calc.from_city_id}=${repeat_sp_lane.from_city_id} and  ${supply_breath_lane_calc.to_city_id}=${repeat_sp_lane.to_city_id}
   
   - join: base_order
     type: left_outer
     relationship: many_to_many
     sql_on: ${supply_breath_lane_calc.from_city_id} = ${base_order.from_city_id} and ${supply_breath_lane_calc.to_city_id} = ${base_order.to_city_id}
     
- explore: temp_supply_calc_view
- explore: base_customer_greater_10million


