<?php get_header(); ?>
<main id="main" role="main">
	<div class="container">
		<div class="row">
      <div class="row__col">
      <?php while ( have_posts() ) : the_post(); ?>
        <h1><?php the_title(); ?></h1>
        <div class="the_content">
          <?php the_content(); ?>
        </div>
        <?php
            $args = array(
                'categories' => true,
                'stamp' => true,
                'read_more' => false,
                'like' => true
            );
            get_template_part('templates/post', 'meta', $args);
        ?>
      <?php endwhile; ?>
      </div>
    </div>
	</div>
</main>
<?php get_footer(); ?>