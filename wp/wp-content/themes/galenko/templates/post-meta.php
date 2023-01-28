<?php global $custom_functions; ?>
<div class="post-meta">
    <?php if($args['categories']): ?>
    <div class="post-meta__categories">
    <?php 
        echo $custom_functions->kg_icons('tag');
        the_category(",");
    ?>
    </div>
    <?php endif; ?>
    <?php if($args['stamp']): ?>
    <div class="post-meta__time">
    <?php 
        echo $custom_functions->kg_icons('calendar');
        the_time("Y-m-d");
    ?>
    </div>
    <?php endif; ?>
    <?php if($args['read_more']): ?>
    <button class="read-more">Read more</button>
    <?php endif; ?>
    <?php if(current_user_can('administrator')): ?>
    <div class="post-meta__edit">
    <?php 
        edit_post_link();
    ?>
    </div>
    <?php endif; ?>
    <?php if(isset($args['like']) && $args['like']): ?>
    <div class="post-meta__like">
    <?php 
        echo $custom_functions->kg_like_button(get_the_ID());
    ?>
    </div>
    <?php endif; ?>
</div>