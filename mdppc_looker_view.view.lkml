view: mdppc_looker_view {
  sql_table_name: dbo.MDPPC_Looker_View ;;

  dimension_group: date_beg_lcl {
    type: time
    timeframes: [
      raw,
      time,
      time_of_day,
      hour_of_day,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.DATE_BEG_LCL ;;
  }

  dimension_group: date_end_lcl {
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
    sql: ${TABLE}.DATE_END_LCL ;;
  }

  dimension: evt_name {
    type: string
    sql: ${TABLE}.evt_name ;;
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}.full_name ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.NOTES ;;
  }

  dimension: obj_name {
    type: string
    sql: ${TABLE}.obj_name ;;
  }

  measure: count {
    type: count
    drill_fields: [full_name, evt_name, obj_name]
  }

  measure: min_time {
    type: date_time
    sql:  min(${date_beg_lcl_time}) ;;
  }

  measure: max_time {
    type: date_time
    sql:  max(${date_beg_lcl_time}) ;;
  }


}
