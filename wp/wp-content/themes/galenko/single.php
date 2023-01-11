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
        <div class="post-meta">
          <div class="post-meta__categories">
            <?php echo $custom_functions->kg_icons('tag'); ?>
            <?php the_category(","); ?>
          </div>
          <div class="post-meta__time">
            <?php echo $custom_functions->kg_icons('calendar'); ?>
            <?php the_time("Y-m-d"); ?>
          </div>
        </div>
        <a href="javascript:history.back()" class="back">&larr; back</a>
      <?php endwhile; ?>
      </div>
    </div>
	</div>
</main>
<?php get_footer(); ?>