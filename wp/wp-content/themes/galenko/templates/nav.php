<?php 
global $custom_functions;
$args = array(
	'theme_location' => 'primary',
	'menu_class'     => 'nav nav-pills',
	'container'      => false,
	'echo'           => false,
	'fallback_cb'    => false
); 
$nav_menu = wp_nav_menu( $args );
?>

  
<header class="primary-header">
  <div class="container">
    <div class="row">
      <div class="row__col">
        <div class="header-content">
          <a href="/" class="logo">
            <span class="kirill">Kirill</span>
            <span class="galenko">Galenko</span>
          </a>

          <?php wp_nav_menu( array(
            'theme_location'  => 'primary',
            'depth'           => 1, // 1 = no dropdowns, 2 = with dropdowns.
            'container'       => 'nav',
            'menu_class'      => 'primary-nav',

        ) ); ?>
        </div>
      </div>
    </div>
  </div>
</header>
