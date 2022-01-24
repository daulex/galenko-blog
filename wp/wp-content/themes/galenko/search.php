<?php get_header() ?>
<main id="main" role="main">
	<article class="page-wrapper">
		<section class="block search-results">
			<div class="container-fluid">
				<div class="row">
					<?php while ( have_posts() ) : the_post(); ?>
						<?php get_template_part('templates/post'); ?>
					<?php endwhile; ?>
				</div>

				<div class="row">
					<nav class="col-12 pagination">
						<?php
							global $wp_query;
							$big = 999999999; // need an unlikely integer
							echo paginate_links( array(
								'base' => str_replace( $big, '%#%', esc_url( get_pagenum_link( $big ) ) ),
								'format' => '?paged=%#%',
								'current' => max( 1, get_query_var('paged') ),
								'total' => $wp_query->max_num_pages
							) );
						?>
					</nav>
				</div>
			</div>
		</section>
	</article>
</main><!-- /#main -->
<?php get_footer(); ?>
