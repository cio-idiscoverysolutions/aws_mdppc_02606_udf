connection: "aws_mdppc-02606-udf"

# include all the views
include: "*.view"

datagroup: aws_mdppc_02606_udf_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: aws_mdppc_02606_udf_default_datagroup

explore: db_settings {}

explore: gps_temp {}

explore: primary_audit {}

explore: mdppc_looker_view {}

explore: mdppc_looker_view_web_detail {}

explore: relationship {}

explore: script {
  join: users {
    type: left_outer
    sql_on: ${script.user_id} = ${users.user_id} ;;
    relationship: many_to_one
  }
}

explore: seq_results_temp {}

explore: user_saves {
  join: users {
    type: left_outer
    sql_on: ${user_saves.user_id} = ${users.user_id} ;;
    relationship: many_to_one
  }
}



explore: users {}
