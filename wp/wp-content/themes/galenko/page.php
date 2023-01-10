<?php get_header(); ?>
<main id="main" role="main">
  <div class="container">
    <div class="row">
      <div class="row__col">
      
      <?php while ( have_posts() ) : the_post(); ?>
      <?php if(!is_front_page()) : ?>
        <h1><?php the_title(); ?></h1>
      <?php endif; ?>
        <?php the_content(); ?>
      <?php endwhile; ?>
      </div>
    </div>
  </div>
</main><!-- /#main -->
<?php get_footer(); ?>