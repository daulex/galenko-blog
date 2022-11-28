<?php
/*
	WP Admin Custom Function
*/

class Awave_Admin {
	public function __construct()
	{
		add_filter( 'admin_footer_text', [$this, 'custom_footer_admin'] );
		add_action( 'wp_before_admin_bar_render', [$this, 'admin_bar'] );
		add_action( 'admin_menu', [$this, 'admin_menu'] );
		add_action( 'wp_dashboard_setup', [$this, 'remove_dashboard_widgets'] );
		add_action( 'load-index.php', function() {
			remove_action('welcome_panel', 'wp_welcome_panel');
		} );
		add_action( 'admin_enqueue_scripts', [$this, 'admin_styles'] );
		add_action( 'login_enqueue_scripts', [$this, 'login_style'] );
		add_filter( 'login_headerurl', [$this, 'login_headerurl'] );
		add_filter( 'login_headertext', [$this, 'login_headertext'] );
		add_filter( 'site_status_tests', [$this, 'remove_unneccessary_tests'] );
		add_filter( 'sanitize_file_name', [$this, 'sanitize_file_names'], 10 );
	}

	public function custom_footer_admin() 
	{
		echo '<span id="footer-thankyou">' . __('Built with <3', 'galenko');
	}

	public function admin_bar()
	{
		global $wp_admin_bar;
		$wp_admin_bar->remove_menu( 'comments' );
	}

	public function admin_menu()
	{
		remove_menu_page( 'edit-comments.php' );
		if ( ! current_user_can( 'manage_options' ) ) {
			remove_menu_page( 'tools.php' );
			remove_submenu_page( 'themes.php', 'customize.php' );
		}
	}

	public function remove_dashboard_widgets()
	{
		remove_meta_box( 'dashboard_quick_press', 'dashboard', 'side' ); //Quick Press widget
		remove_meta_box( 'dashboard_recent_drafts', 'dashboard', 'side' ); //Recent Drafts
		remove_meta_box( 'dashboard_primary', 'dashboard', 'side' ); //WordPress.com Blog
		remove_meta_box( 'dashboard_secondary', 'dashboard', 'side' ); //Other WordPress News
		remove_meta_box( 'dashboard_incoming_links', 'dashboard', 'normal' ); //Incoming Links
		remove_meta_box( 'dashboard_plugins', 'dashboard', 'normal' ); //Plugins
		remove_meta_box( 'dashboard_recent_comments',	 'dashboard', 'normal'); //Comments
	}

	

	public function admin_styles() {
		$csstime = filemtime( get_template_directory() . '/inc/css/admin-styles.css' );
		wp_enqueue_style('awave_admin_styles', get_template_directory_uri() . '/inc/css/admin-styles.css', '', $csstime, 'all');
	}

	public function login_style()
	{
		$csstime = filemtime( get_template_directory() . '/inc/css/login-styles.css' );
		wp_enqueue_style( 'awave_login_styles', get_template_directory_uri() . '/inc/css/login-styles.css', '', $csstime, 'all' ); 
	}

	public function login_headerurl()
	{
		return "https://galenko.lv/";
	}

	public function login_headertext()
	{
		return "Galenko";
	}

	public function remove_unneccessary_tests( $tests )
	{
		$page_url = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
		$domain = parse_url($page_url);
		if ( strpos( $domain['host'], 'awave.site' ) !== false ) :
			unset( $tests['direct']['debug_enabled'] );
		endif;

		unset( $tests['direct']['plugin_theme_auto_updates'] );
		unset( $tests['direct']['theme_version'] );
		unset( $tests['async']['background_updates'] );

		return $tests;
	}

	public function sanitize_file_names( $filename )
	{
		$filename = str_replace( 'å', 'a', $filename );
		$filename = str_replace( 'ä', 'a', $filename );
		$filename = str_replace( 'ö', 'o', $filename );
		$filename = str_replace( 'Å', 'A', $filename );
		$filename = str_replace( 'Ä', 'A', $filename );
		$filename = str_replace( 'Ö', 'O', $filename );
		return $filename;
	}
}

new Awave_Admin();