#
# === Authors
#
# Author Name Pablo Panero (pablo.panero@cern.ch)
#


class misp (
  # MISP installation
  # # MISP repositories
  $misp_git_tag = 'v2.4.71',
  $stix_git_repo = 'https://github.com/STIXProject/python-stix.git',
  $stix_git_tag = 'v1.1.1.4',
  $cybox_git_repo = 'https://github.com/CybOXProject/python-cybox.git',
  $cybox_git_tag = 'v2.1.0.12',
  $mixbox_git_repo = 'https://github.com/CybOXProject/mixbox.git',
  $mixbox_git_tag = 'v1.0.2',
  $pydeep_git_repo = 'https://github.com/kbandla/pydeep.git',
  $pydeep_git_tag = 'e4ce348566293475016ca7fa9fb7fc4f61f1997f', # Using SHA from latest commit in 0.2 tag, because there is also a 0.2 branch
  $pymisp_rpm = false,
  $lief = false,
  $lief_package_name = '',
  # # Services
  $webservername = 'httpd',
  $redis_server = true,
  # # database.php
  $db_name = 'misp',
  $db_user = 'misp',
  $db_host = 'localhost',
  $db_port = '3306',
  $db_password = '',
  # # Redis DB
  $redis_host = '127.0.0.1',
  $redis_port = 6379,
  $redis_database = 13,
  $redis_password = undef,
  # # config.php
  $debug = 0,
  $site_admin_debug = false,
  # # MISP puppet configuration
  $install_dir = '/var/www/MISP/',
  $config_dir = '/var/www/MISP/app/Config/',
  $timezone = 'UTC',
  $default_user = 'apache',
  $default_group = 'apache',
  $default_high_user = 'root',
  $default_high_group = 'apache',
  # # Security
  $security_level = 'medium',
  $salt = 'Rooraenietu8Eeyo<Qu2eeNfterd-dd+',
  $cipherseed = '',
  $auth_method = '',# Empty means default user-password login method
  $password_policy_length = 6,
  $password_policy_complexity = '/((?=.*\\d)|(?=.*\\W+))(?![\\n])(?=.*[A-Z])(?=.*[a-z]).*$/',
  $sanitise_attribute_on_delete = false,
  $require_password_confirmation = false,
  # # MISP parameters
  $uuid = 0,
  $live = true,
  $enable_advanced_correlations = false,
  $max_correlations_per_event = 5000,
  $maintenance_message = 'Great things are happening! MISP is undergoing maintenance, but will return shortly. You can contact the administration at \\$email.',
  $footermidleft = '',
  $footermidright = '',
  $footer_logo = '',
  $home_logo = '',
  $main_logo = '',
  $org = 'ORGNAME',
  $host_org_id = '1',
  $showorg = true,
  $threatlevel_in_email_subject = true,
  $email_subject_tlp_string = 'TLP Amber',
  $email_subject_tag = 'tlp',
  $email_subject_include_tag_name = true,
  $background_jobs = true,
  $attachments_dir = 'app/files',
  $cached_attachments = true,
  $email = 'root@localhost',# This address is used as sender (from) when sending notifications
  $disable_emailing = false,
  $contact = 'root@localhost',# This address is used in error messages
  $cveurl = 'http://cve.circl.lu/cve/',
  $disablerestalert = false,
  $extended_alert_subject = true,
  $default_event_distribution = '1',
  $default_attribute_distribution = 'event',
  $default_event_threat_level = '1',
  $tagging = true,
  $full_tags_on_event_index = true,
  $welcome_text_top = '',
  $welcome_text_bottom = '',
  $welcome_logo = '',
  $welcome_logo2 = '',
  $take_ownership_xml_import = false,
  $terms_download = false,
  $terms_file = '',
  $showorgalternate = false,
  $unpublishedprivate = false,
  $new_user_text = 'Dear new MISP user,\\n\\nWe would hereby like to welcome you to the \\$org MISP community.\\n\\n Use the credentials below to log into MISP at \\$misp, where you will be prompted to manually change your password to something of your own choice.\\n\\nUsername: \\$username\\nPassword: \\$password\\n\\nIf you have any questions, don\'t hesitate to contact us at: \\$contact.\\n\\nBest regards,\\nYour \\$org MISP support team',
  $password_reset_text = 'Dear MISP user,\\n\\nA password reset has been triggered for your account. Use the below provided temporary password to log into MISP at \\$misp, where you will be prompted to manually change your password to something of your own choice.\\n\\nUsername: \\$username\\nYour temporary password: \\$password\\n\\nIf you have any questions, don\'t hesitate to contact us at: \\$contact.\\n\\nBest regards,\\nYour \\$org MISP support team',
  $enable_event_blacklisting = true,
  $enable_org_blacklisting = true,
  $log_client_ip = true,
  $log_auth = false,
  $mangle_push_to_23 = false,  # Advised against, FALSE
  $delegation = false,
  $show_correlations_on_index = false,
  $show_proposals_count_on_index = false,
  $show_sightings_count_on_index =  false,
  $show_discussions_count_on_index =  false,
  $disable_user_self_management = false,
  $block_event_alert = false,
  $block_event_alert_tag = 'no-alerts="true"',
  $block_old_event_alert = false,
  $block_old_event_alert_age = 30,
  $rh_shell_fix = false,
  $rh_shell_fix_path = '/opt/rh/rh-php56/root/usr/bin:/opt/rh/rh-php56/root/usr/sbin',
  $tmpdir = '/tmp',
  $custom_css = '',
  $proposals_block_attributes = true,
  $incoming_tags_disabled_by_default = false,
  $completely_disable_correlation = false,
  $allow_disabling_correlation = false,
  $event_view_filter_fields = 'id, uuid, value, comment, type, category, Tag.name',
  # # GPG
  $gpg_binary = '/usr/bin/gpg',
  $gpg_onlyencrypted = false,
  $gpg_email = 'no-reply@localhost',
  $gpg_homedir = '/var/www/MISP/',
  $gpg_password = '',
  $gpg_bodyonlyencrypted = false,
  # # SMIME
  $smime_enabled = false,
  $smime_email = '',
  $smime_cert_public_sign = '',
  $smime_key_sign = '',
  $smime_password = '',
  # # Proxy
  $proxy_host = '',
  $proxy_port = '',
  $proxy_method = '',
  $proxy_user = '',
  $proxy_password = '',
  # # SecureAuth
  $secure_auth_amount = 5,
  $secure_auth_expire = 300,
  # # Session
  $session_auto_regenerate = false,
  $session_defaults = 'php',
  $session_timeout = '60',
  # # Plugin
  $rpz_policy = 0,
  $rpz_walled_garden = '127.0.0.1',
  $rpz_serial = '$date00',
  $rpz_refresh = '2h',
  $rpz_retry = '30m',
  $rpz_expiry = '30d',
  $rpz_minimum_ttl = '1h',
  $rpz_ttl = '1w',
  $rpz_ns = 'localhost',
  $rpz_ns_alt = '',
  $rpz_email = 'root.localhost',
  $zeromq_enable = false,
  $zeromq_port = 50000,
  $zeromq_redis_host = 'localhost',
  $zeromq_redis_port = 6379,
  $zeromq_redis_password = '',
  $zeromq_redis_database = '1',
  $zeromq_redis_namespace = 'mispq',
  $zeromq_event_notifications_enable = false,
  $zeromq_object_notifications_enable = false,
  $zeromq_object_reference_notifications_enable = false,
  $zeromq_attribute_notifications_enable = false,
  $zeromq_audit_notifications_enable = false,
  $syslog = false,
  $sightings_enable = false,
  $sightings_policy = 0,
  $sightings_anonymise = false,
  $sightings_range = 365,
  $customauth_enable = false,
  $customauth_header = 'Authorization',
  $customauth_use_header_namespace = true,
  $customauth_header_namespace = 'HTTP_',
  $customauth_required = false,
  $customauth_only_allow_source = '',
  $customauth_name = 'External authentication',
  $customauth_disable_logout = false,# TODO
  $customauth_custom_password_reset = '',
  $customauth_custom_logout = '',
  $enrichment_services_enable = true,
  $enrichment_timeout = 10,
  $enrichment_hover_enable = true,
  $enrichment_hover_timeout = 5,
  $enrichment_services_url = 'http://127.0.0.1',
  $enrichment_services_port = 6666,
  $import_services_enable = true,
  $import_timeout = 10,
  $import_services_url = 'http://127.0.0.1',
  $import_services_port = 6666,
  $export_services_url = 'http://127.0.0.1',
  $export_services_port = 6666,
  $export_services_enable = true,
  $export_timeout = 10,
  $cortex_services_enable = false,
  $cortex_services_url = 'http://127.0.0.1/api',
  $cortex_services_port = 9000,
  $cortex_timeout = 120,
  # ApacheShibbAuth
  $shib_use_default_org = false,
  $shib_default_org = '1',
  $egroup_role_match = {},
) {

  contain '::misp::dependencies'
  contain '::misp::install'
  contain '::misp::config'
  contain '::misp::service'
}
