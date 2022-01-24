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
		add_action( 'welcome_panel', [$this, 'welcome_panel'] );
		add_action( 'login_enqueue_scripts', [$this, 'login_style'] );
		add_filter( 'login_headerurl', [$this, 'login_headerurl'] );
		add_filter( 'login_headertext', [$this, 'login_headertext'] );
	}

	public function custom_footer_admin() 
	{
		echo '<span id="footer-thankyou">' . __('Built with love by', 'awave') . '<a href="https://www.awave.se/" target="_blank"> Awave.se</a></span>';
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

	public function welcome_panel()
	{
		?>
		<script type="text/javascript">
			// Hide default welcome message
			jQuery(document).ready( function($) {
				$('div.welcome-panel-content').hide();
				$('a.welcome-panel-close').text('');
			});
		</script>

		<div class="custom-welcome-panel-content">
			<a href="https://www.awave.se/" class="dashboard-logo" target="_blank"><img src="<?php echo get_template_directory_uri() ?>/inc/img/awave-logo.png"></a>
			<div style="float:right"><img src="<?php echo get_template_directory_uri() ?>/inc/img/awave.png" width="165"></div>
			<h1><?php _e( 'Welcome to your site!', 'awave'); ?></h1>
			<p class="about-description"><?php _e( 'This is a site created by Awave. Down below you can see information on how to get started. Place your text, contact information or other stuff on your site. If you have any question you could always contact us or send us an email by visiting <a href="http://www.awave.se" target="_blank">our website</a>. We also have a support system where you can put all your questions or issues that you want fixed. You can go there by clicking <a href="http://kund.awave.se" target="_blank">here</a>.', 'awave'); ?></p>
			<div class="welcome-panel-column-container">
				<div class="welcome-panel-column">
					<h4><?php _e( "Let's Get Started",'awave' ); ?></h4>
					<?php printf( '<a href="%swp-admin/customize.php" class="button button-primary button-hero load-customize hide-if-no-customize">' . __( 'Customize Your Site', 'awave' ) . '</a>', home_url( '/' ) ); ?>
					<p class="hide-if-no-customize"><?php printf( __( 'or, <a href="%s">edit your site settings</a>', 'awave' ), admin_url( 'options-general.php' ) ); ?></p>
				</div><!-- .welcome-panel-column -->
				<div class="welcome-panel-column">
					<h4><?php _e( 'Next Steps', 'awave' ); ?></h4>
					<ul>
						<?php if ( 'page' == get_option( 'show_on_front' ) && ! get_option( 'page_for_posts' ) ) : ?>
						<li><?php printf( '<a href="%s" class="welcome-icon welcome-edit-page">' . __( 'Edit your front page', 'awave' ) . '</a>', get_edit_post_link( get_option( 'page_on_front' ) ) ); ?></li>
						<li><?php printf( '<a href="%s" class="welcome-icon welcome-add-page">' . __( 'Add additional pages', 'awave' ) . '</a>', admin_url( 'post-new.php?post_type=page' ) ); ?></li>
						<?php elseif ( 'page' == get_option( 'show_on_front' ) ) : ?>
						<li><?php printf( '<a href="%s" class="welcome-icon welcome-edit-page">' . __( 'Edit your front page', 'awave' ) . '</a>', get_edit_post_link( get_option( 'page_on_front' ) ) ); ?></li>
						<li><?php printf( '<a href="%s" class="welcome-icon welcome-add-page">' . __( 'Add additional pages', 'awave' ) . '</a>', admin_url( 'post-new.php?post_type=page' ) ); ?></li>
						<li><?php printf( '<a href="%s" class="welcome-icon welcome-write-blog">' . __( 'Add a blog post', 'awave' ) . '</a>', admin_url( 'post-new.php' ) ); ?></li>
						<?php else : ?>
						<li><?php printf( '<a href="%s" class="welcome-icon welcome-write-blog">' . __( 'Write your first blog post', 'awave' ) . '</a>', admin_url( 'post-new.php' ) ); ?></li>
						<li><?php printf( '<a href="%s" class="welcome-icon welcome-add-page">' . __( 'Add an About page', 'awave' ) . '</a>', admin_url( 'post-new.php?post_type=page' ) ); ?></li>
						<?php endif; ?>
						<li><?php printf( '<a href="%s" class="welcome-icon welcome-view-site">' . __( 'View your site', 'awave' ) . '</a>', home_url( '/' ) ); ?></li>
					</ul>
				</div><!-- .welcome-panel-column -->
				<div class="welcome-panel-column welcome-panel-last">
					<h4><?php _e( 'More Actions', 'awave' ); ?></h4>
					<ul>
						<li><?php printf( '<div class="welcome-icon welcome-widgets-menus">' . __( 'Manage <a href="%1$s">widgets</a> or <a href="%2$s">menus</a>', 'awave' ) . '</div>', admin_url( 'widgets.php' ), admin_url( 'nav-menus.php' ) ); ?></li>
						<li><?php printf( '<a href="%s" class="welcome-icon welcome-comments">' . __( 'Turn comments on or off', 'awave' ) . '</a>', admin_url( 'options-discussion.php' ) ); ?></li>
						<li><?php printf( '<a href="%s" target="_blank" class="welcome-icon welcome-learn-more">' . __( 'Learn more about getting started', 'awave' ) . '</a>', 'http://codex.wordpress.org/First_Steps_With_WordPress' ); ?></li>
					</ul>
				</div><!-- .welcome-panel-column welcome-panel-last -->
			</div><!-- .welcome-panel-column-container -->
		</div><!-- .custom-welcome-panel-content -->
		<?php
	}

	public function login_style()
	{
		?>
		<style type="text/css"> 
			body.login{
				background-color: #fff;
			}
			body.login div#login h1 a {
				background-image: url(<?php echo get_template_directory_uri(); ?>/inc/img/awave-logo.png);
				height: 80px;
				width: 150px;
				background-size: 150px;

			} 
			body.login #loginform{
				background-color: #FEF9F5;
			}
		</style>
		<?php
	}

	public function login_headerurl()
	{
		return "https://www.awave.se/";
	}

	public function login_headertext()
	{
		return "Awave";
	}
}

new Awave_Admin();