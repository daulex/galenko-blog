<?php get_header(); ?>
<main id="main" role="main">
	<?php while ( have_posts() ) : the_post(); ?>
		<?php the_content(); ?>
        <a href="javascript:history.back()" class="back">&larr; back</a>

	<?php endwhile; ?>
</main><!-- /#main -->
<?php get_footer(); ?>