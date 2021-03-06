<?php 

$args = array(
	'theme_location' => 'primary',
	'menu_class'     => 'nav nav-pills',
	'container'      => false,
	'echo'           => false,
	'fallback_cb'    => false
); 
$nav_menu = wp_nav_menu( $args );
?>
<div class="container">
<header class="primary-header">
  <a href="/" class="logo">
    
    <?php
        $gravatar_link = 'http://www.gravatar.com/avatar/' . md5('kirillgalenko@gmail.com') . '?s=128';
    ?>
    <img src="<?php echo $gravatar_link; ?>" alt="<?php bloginfo(); ?>">
  </a>

  <?php wp_nav_menu( array(
    'theme_location'  => 'primary',
    'depth'           => 1, // 1 = no dropdowns, 2 = with dropdowns.
    'container'       => 'nav',
    'menu_class'      => 'primary-nav',

) ); ?>
</header>
</div>