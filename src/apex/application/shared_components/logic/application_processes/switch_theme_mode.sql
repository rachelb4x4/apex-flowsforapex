prompt --application/shared_components/logic/application_processes/switch_theme_mode
begin
--   Manifest
--     APPLICATION PROCESS: SWITCH_THEME_MODE
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>2400405578329584
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'FLOWS4APEX'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(5593447532877397)
,p_process_sequence=>1
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SWITCH_THEME_MODE'
,p_process_sql_clob=>'flow_theme_api.switch_theme_mode(:REQUEST);'
,p_process_when=>'LIGHT_MODE DARK_MODE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.component_end;
end;
/
