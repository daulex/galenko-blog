<?php
/*
Plugin Name: Awave Monitor
Plugin URI: https://www.awave.se
Description: Agent for monitoring.
Version: 1.0
Author: Awave
Author URI: https://www.awave.se
*/

require_once("inc/constants.php");
require_once("inc/functions.php");

/*
If there is no defined MONITORING_TOKEN we generate it, and if possible we send it to support email
*/

if (!defined("MONITORING_TOKEN")){
    $token_from_options = awavemonitor_get_monitoring_token_option();
    if (!empty($token_from_options)){
        define("MONITORING_TOKEN",$token_from_options);
    }
}

awavemonitor_init();
if (isset($_REQUEST['monitoring'])) {
    awavemonitor_agent();
}
