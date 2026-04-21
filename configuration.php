<?php
$license = 'WHMCS-b33d0d3aa21f3f14489d';
$db_host = 'whmcs-db';
$db_port = '3306';
$db_username = 'whmcs';
$db_password = 'golo_whmcs_password';
$db_name = 'whmcs';
$db_tls_ca = '';
$db_tls_ca_path = '';
$db_tls_cert = '';
$db_tls_cipher = '';
$db_tls_key = '';
$db_tls_verify_cert = '';
$cc_encryption_hash = '4GnIDMUD6QvyB0JIITrdCzWro86kvzpmmybLML9mJNo5ZE6ZzQubvguIIT3buN7Y';
$templates_compiledir = 'templates_c';
$mysql_charset = 'utf8';
$customadminpath = 'golo123';
$disable_admin_ticket_page_counts = true;  // 禁用后台工单状态统计
$disable_clients_list_services_summary = true; // 禁用客户列表服务数量统计
$cache_type = 'redis';
$cache_config = [
    'host' => '127.0.0.1', // 你的 Redis 服务器地址
    'port' => 6379
];
$disable_session_ipcheck = 'true';
if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
    $_SERVER['REMOTE_ADDR'] = $_SERVER['HTTP_X_FORWARDED_FOR'];
}

