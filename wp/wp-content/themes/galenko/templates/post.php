<article class="post editor_content" id="<?php echo $post->ID; ?>">
<?php if ( has_post_thumbnail() ) { ?>
    <a href="<?php the_permalink(); ?>" class="post-thumbnail">
        <?php the_post_thumbnail( 'thumbnail' ); ?>
    </a>
<?php } ?>
	<div class="content-col">
        <h2><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h2>
        <?php
            the_excerpt();
            $args = array(
                'categories' => true,
                'stamp' => true,
                'read_more' => true
            );
            get_template_part('templates/post', 'meta', $args);
        ?>
    </div>
</article>
