<?php

function awavemonitor_init()
{
    add_action('admin_menu', 'awavemonitor_add_settings_links');
}

function awavemonitor_add_settings_links()
{
    add_options_page(
        'Awave monitor',
        'Awave monitor',
        "manage_options",
        "awavemonitor/settings",
        "awavemonitor_get_settings_page_content"
    );
    add_filter('plugin_action_links_' . plugin_basename(awavemonitor_PLUGIN_FILE), 'awavemonitor_get_plugin_links');
}

function awavemonitor_get_plugin_links($links)
{
    $links[] = '<a href="' . awavemonitor_get_settings_page_url() . '">Settings</a>';
    return $links;
}

function awavemonitor_get_settings_page_url()
{
    return esc_url(get_admin_url(null, 'options-general.php?page=awavemonitor/settings'));
}

function awavemonitor_get_settings_page_relative_path()
{
    return awavemonitor_PLUGIN_PATH . '/awavemonitor_settings.php';
}

function awavemonitor_get_settings_page_content()
{
    require_once awavemonitor_get_settings_page_relative_path();
}

function awavemonitor_get_base_info()
{
    include_once('wp-admin/includes/plugin.php');

    $plugin_dir = plugin_dir_path(__FILE__);

    $site_name = get_bloginfo('name');
    $agent_module_data = get_plugin_data(awavemonitor_PLUGIN_PATH . '/awavemonitor.php');
    $module_version = $agent_module_data['Version'];
    $www = $_SERVER['SERVER_NAME'];
    $software = array('webserver' => $_SERVER['SERVER_SOFTWARE']);
    $scheme = $_SERVER['REQUEST_SCHEME'];

    $return = array();
    $return['info'] = array('agent' => array('cms' => 'Wordpress', 'version' => $module_version), 'site_name' => $site_name, 'www' => $www, 'software' => $software, 'scheme' => $scheme);

    return $return;
}

function awavemonitor_token_is_valid()
{
    $valid = false;
    $token = isset($_REQUEST['token']) ? $_REQUEST['token'] : false;
    $auth_key = MONITORING_TOKEN;

    if (!$token) {
        $valid = false;
    } else if ($token == $auth_key) {
        $valid = true;
    }

    return $valid;
}

function awavemonitor_get_latest_wp_version()
{
    require_once ABSPATH . '/wp-admin/includes/update.php';
    require_once ABSPATH . WPINC . '/version.php';
    wp_version_check(array(), true); //force check from wp-server.

    $current = get_site_transient('update_core');
    $current_version = $current->version_checked;

    $core_updates = get_core_updates();
    if ($core_updates && !empty($core_updates) && count($core_updates) > 0) {
        $core_updates_data = $core_updates['0'];

        if ($current_version != $core_updates_data->version) {
            return $core_updates_data;
        }
    }

    return false;
}

function awavemonitor_agent()
{
    if (awavemonitor_token_is_valid()) {
        include_once('wp-admin/includes/plugin.php');
        $plugin_base_dir = 'wp-content/plugins/';
        $base_data = awavemonitor_get_base_info();

        $return = $base_data;
        $return['core'] = array();
        $return['modules'] = array();


        wp_update_plugins();
        $plugin_updates = get_site_transient('update_plugins');

        $updates_available = (array)$plugin_updates->response;
        $raw_data = (array)$plugin_updates->checked;
        $core_updates = awavemonitor_get_latest_wp_version();


        $return['core']['name'] = 'Wordpress';
        $return['core']['version'] = 0;
        $return['core']['modules'] = array();
        $return['core']['updates']['security'] = array();
        if (is_array($core_updates) && !empty($core_updates) && count($core_updates) > 0) {
            $return['core']['updates']['security'][$core_updates->version] = array('version' => $core_updates->version, 'release_link' => FALSE, 'date' => FALSE);
        }

        foreach ($raw_data as $plugin_file => $version) {
            $plugin = get_plugin_data($plugin_base_dir . $plugin_file);

            $return['modules'][$plugin['Name']] = array('name' => $plugin['Name'], 'description' => $plugin['Description'], 'version' => $plugin['Version'], 'updates' => array('security' => array()));

            if (isset($updates_available[$plugin_file])) {
                $update_data = $updates_available[$plugin_file];

                if (!empty($update_data)) {
                    $return['modules'][$plugin['Name']]['updates']['security'][$update_data->new_version] = array('version' => $update_data->new_version, 'release_link' => $update_data->url . 'changelog/', 'date' => false);
                }
            }
        }

        wp_send_json($return);

        if ($plugin_updates && !empty($plugin_updates->response)) {
            wp_clean_plugins_cache();
        }
    }
}

function awavemonitor_domain_ingore_list()
{
    return array("awave.site", "a-demo.se", "cloudnet.cloud");
}

function awavemonitor_ignore_domain()
{
    $ignore_list = awavemonitor_domain_ingore_list();
    foreach($ignore_list as $i){
        if (substr_count($_SERVER['SERVER_NAME'],$i)>0){
            return true;
        }
    }
    return false;
}

function awavemonitor_get_monitoring_token_option()
{
    $token = get_option("AWAVEMONITOR_MONITORING_TOKEN");
    if (!$token && !awavemonitor_ignore_domain()) {
        //no token so we have to generate
        update_option("AWAVEMONITOR_MONITORING_TOKEN", md5(time()));
        $token = get_option("AWAVEMONITOR_MONITORING_TOKEN");
        $mail_sent = get_option("AWAVEMONITOR_MONITORING_EMAIL_SENT");

        if (!$mail_sent || empty($mail_sent)) {
            add_action('plugins_loaded', 'awavemonitor_send_email');
        }
    }
    return $token;
}

function awavemonitor_send_email()
{
    $token = defined("MONITORING_TOKEN") ? MONITORING_TOKEN : "";
    if (!empty($token)) {
        $mail_sent = wp_mail(awavemonitor_SUPPROT_EMAIL, "Generated new Awave monitor token.", "Generated new AWAVE MONITOR TOKEN $token for " . $_SERVER['SERVER_NAME']);
        update_option("AWAVEMONITOR_MONITORING_EMAIL_SENT", awavemonitor_SUPPROT_EMAIL);
    }
}

function awavemonitor_get_settings()
{
    $token_from_option = awavemonitor_get_monitoring_token_option();
    $defined_via_const = defined('MONITORING_TOKEN') && MONITORING_TOKEN !== $token_from_option ? true : false;
    return array(
        'AWAVEMONITOR_DEFINED_VIA_CONST' => $defined_via_const,
        'MONITORING_TOKEN' => defined('MONITORING_TOKEN') ? MONITORING_TOKEN : awavemonitor_get_monitoring_token_option(),
        'AWAVEMONITOR_MONITORING_EMAIL_SENT' => get_option("AWAVEMONITOR_MONITORING_EMAIL_SENT")
    );
}
