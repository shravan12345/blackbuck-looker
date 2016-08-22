- view: base_trucktype
  sql_table_name: blackbuck_prod.base_trucktype
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: equivalent_weightage
    type: number
    sql: ${TABLE}.equivalent_weightage

  - dimension: is_active
    type: yesno
    sql: ${TABLE}.is_active

  - dimension: is_container
    type: yesno
    sql: ${TABLE}.is_container

  - dimension: is_intracity
    type: yesno
    sql: ${TABLE}.is_intracity

  - dimension: loading_charge
    type: number
    sql: ${TABLE}.loading_charge

  - dimension: max_breadth
    type: number
    sql: ${TABLE}.max_breadth

  - dimension: max_height
    type: number
    sql: ${TABLE}.max_height

  - dimension: max_length
    type: number
    sql: ${TABLE}.max_length

  - dimension: max_passing_weight
    type: number
    sql: ${TABLE}.max_passing_weight

  - dimension: min_breadth
    type: number
    sql: ${TABLE}.min_breadth

  - dimension: min_height
    type: number
    sql: ${TABLE}.min_height

  - dimension: min_length
    type: number
    sql: ${TABLE}.min_length

  - dimension: min_passing_weight
    type: number
    sql: ${TABLE}.min_passing_weight

  - dimension: rtkm_tonnage
    type: number
    sql: ${TABLE}.rtkm_tonnage

  - dimension: sme_app_name
    type: string
    sql: ${TABLE}.sme_app_name

  - dimension: sme_app_visible
    type: yesno
    sql: ${TABLE}.sme_app_visible

  - dimension: truck_type
    type: string
    sql: ${TABLE}.truck_type

  - dimension: unloading_charge
    type: number
    sql: ${TABLE}.unloading_charge

  - dimension: weightage
    type: number
    sql: ${TABLE}.weightage

  - measure: count
    type: count
    drill_fields: [id, sme_app_name]

