- view: base_orderinvoicerelatedinfo
  sql_table_name: zinka.base_orderinvoicerelatedinfo
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: checkpost_charges
    type: number
    sql: ${TABLE}.checkpost_charges

  - dimension_group: cn
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.cn_date

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_date

  - dimension: custom_truck_type
    type: string
    sql: ${TABLE}.custom_truck_type

  - dimension: custom_tt_tonnage
    type: number
    sql: ${TABLE}.custom_tt_tonnage

  - dimension_group: date_of_arrival
    type: time
    timeframes: [time, date, week, month,raw]
    sql: ${TABLE}.date_of_arrival

  - dimension_group: date_of_delivery
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_of_delivery

  - dimension: deleted_by_id
    type: number
    sql: ${TABLE}.deleted_by_id

  - dimension: desc_of_goods
    type: string
    sql: ${TABLE}.desc_of_goods

  - dimension: dest_detention_days
    type: number
    sql: ${TABLE}.dest_detention_days

  - dimension: do_sto_ssl_num
    type: string
    sql: ${TABLE}.do_sto_ssl_num

  - dimension: equivalent_weight
    type: number
    sql: ${TABLE}.equivalent_weight

  - dimension: finalized_by_id
    type: number
    sql: ${TABLE}.finalized_by_id

  - dimension: freight_amount
    type: number
    sql: ${TABLE}.freight_amount

  - dimension: goods_value
    type: number
    sql: ${TABLE}.goods_value

  - dimension: green_tax
    type: number
    sql: ${TABLE}.green_tax

  - dimension: gross_weight
    type: number
    sql: ${TABLE}.gross_weight

  - dimension: invoice_from_city
    type: string
    sql: ${TABLE}.invoice_from_city

  - dimension: invoice_number
    type: string
    sql: ${TABLE}.invoice_number

  - dimension: invoice_to_city
    type: string
    sql: ${TABLE}.invoice_to_city

  - dimension: invoicing_address
    type: string
    sql: ${TABLE}.invoicing_address

  - dimension: is_deleted
    type: yesno
    sql: ${TABLE}.is_deleted

  - dimension: is_finalized
    type: yesno
    sql: ${TABLE}.is_finalized

  - dimension: last_modified_by_id
    type: number
    sql: ${TABLE}.last_modified_by_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified_date

  - dimension: loading_charge
    type: number
    sql: ${TABLE}.loading_charge

  - dimension: loading_detention
    type: number
    sql: ${TABLE}.loading_detention

  - dimension: lr_number
    type: string
    sql: ${TABLE}.lr_number

  - dimension: multiple_loading_pt_charge
    type: number
    sql: ${TABLE}.multiple_loading_pt_charge

  - dimension: multiple_unloading_pt_charge
    type: number
    sql: ${TABLE}.multiple_unloading_pt_charge

  - dimension: num_pkgs
    type: number
    sql: ${TABLE}.num_pkgs

  - dimension: obd_number
    type: string
    sql: ${TABLE}.obd_number

  - dimension: order_id
    type: number
    sql: ${TABLE}.order_id

  - dimension: plywood_charges
    type: number
    sql: ${TABLE}.plywood_charges

  - dimension: qty_charged_tons
    type: number
    sql: ${TABLE}.qty_charged_tons

  - dimension: rate_as_per_serv_no
    type: number
    sql: ${TABLE}.rate_as_per_serv_no

  - dimension: service_entry_num
    type: string
    sql: ${TABLE}.service_entry_num

  - dimension: src_detention_days
    type: number
    sql: ${TABLE}.src_detention_days

  - dimension: truck_type_id
    type: number
    sql: ${TABLE}.truck_type_id

  - dimension: type_of_pkgs
    type: string
    sql: ${TABLE}.type_of_pkgs

  - dimension: unloading_charge
    type: number
    sql: ${TABLE}.unloading_charge

  - dimension: unloading_detention
    type: number
    sql: ${TABLE}.unloading_detention

  - dimension: weight
    type: number
    sql: ${TABLE}.weight

  - measure: count
    type: count
    drill_fields: [id]