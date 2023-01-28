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
</div>