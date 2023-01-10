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
<div class="container">
  <header class="primary-header">
    <a href="/" class="logo">
      <img width="76" height="76" src="/logo-kg.svg" alt="<?php bloginfo(); ?>">
    </a>

    <?php wp_nav_menu( array(
      'theme_location'  => 'primary',
      'depth'           => 1, // 1 = no dropdowns, 2 = with dropdowns.
      'container'       => 'nav',
      'menu_class'      => 'primary-nav',

  ) ); ?>
    <ul id="social-icons">
      <li>
        <a href="https://github.com/daulex" target="_blank" title="github">
          <?php echo $custom_functions->kg_icons('github'); ?>
        </a>
      </li>
      <li>
        <a href="https://www.instagram.com/kirill.codes/" target="_blank" title="instagram">
          <?php echo $custom_functions->kg_icons('instagram'); ?>
        </a>
      </li>
    </ul>
  </header>
</div>
