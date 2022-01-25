<?php get_header(); ?>
<main id="main" role="main">
	<?php while ( have_posts() ) : the_post(); ?>
        <h1><?php the_title(); ?></h1>
		<?php the_content(); ?>
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
</main><!-- /#main -->
<?php get_footer(); ?>