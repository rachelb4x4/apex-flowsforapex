prompt --application/shared_components/logic/application_processes/reset_theme_mode
begin
--   Manifest
--     APPLICATION PROCESS: RESET_THEME_MODE
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
 p_id=>wwv_flow_api.id(6213103405434761)
,p_process_sequence=>1
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RESET_THEME_MODE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     l_theme_name varchar2(100);',
'     l_theme_plugin_class varchar2(10);',
'begin',
'',
'    apex_theme.clear_user_style(',
'        p_application_id => :APP_ID,',
'        p_user           => :APP_USER,',
'        p_theme_number   => 42',
'    );',
'    ',
'    if :REQUEST = ''RESET_LIGHT''',
'        then l_theme_name := ''Vita''; l_theme_plugin_class := ''FLOWS'';',
'    elsif :REQUEST = ''RESET_DARK''',
'        then l_theme_name := ''Vita - Dark''; l_theme_plugin_class := ''FLOWS-DARK'';',
'    end if;',
'    ',
'    apex_theme.set_session_style(',
'        p_theme_number  => 42,',
'        p_name => l_theme_name',
'    );',
'    ',
'    apex_util.set_session_state(',
'        p_name => ''THEME_PLUGIN_CLASS'',',
'        p_value => l_theme_plugin_class',
'    );',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RESET_DARK RESET_LIGHT'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.component_end;
end;
/