<?php get_header(); ?>
<main id="main" role="main">
	<?php while ( have_posts() ) : the_post(); ?>
		<?php the_content(); ?>
	<?php endwhile; ?>
</main><!-- /#main -->
<?php get_footer(); ?>