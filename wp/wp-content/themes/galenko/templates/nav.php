<?php 
$args = array(
	'theme_location'  => 'primary',
	'menu_class'      => 'navbar-nav',
	'container'       => 'nav',
	'container_class' => 'navbar',
	'echo'            => false,
	'fallback_cb'     => false
); 
$nav_menu = wp_nav_menu( $args );
?>
<header class="site-header">
	<div class="container">
		<?php echo $nav_menu; ?>
	</div>
</header>
