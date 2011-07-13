<?php if ( ! defined('ONAPP_PATH')) die('No direct script access allowed');

require_once dirname(__FILE__) . DIRECTORY_SEPARATOR . "c_base_settings.php";

class Log_Settings extends Base_Settings
{
    protected $config = array(
        'template'     => 'logSettings',
        'title'        => 'LOG_SETTINGS',
        'info_title'   => 'LOG_SETTINGS',
        'info_body'    => 'LOG_SETTINGS_INFO',
    );
}
