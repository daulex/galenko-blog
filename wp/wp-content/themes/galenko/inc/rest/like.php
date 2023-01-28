<?php
/**
 * Custom WordPress REST endpoint to record a like
 * Takes in a post ID and increments the like count stored in post_meta
 * Returns 200 status code on success
 */
class KG_Like_Post extends WP_REST_Controller
{
    public function __construct()
    {
        add_action('rest_api_init', [$this, 'register_routes']);
    }
    public function register_routes()
    {
        register_rest_route('kg/v1', '/like', [
            'methods' => 'POST',
            'callback' => [$this, 'like_post'],
            'permission_callback' => '__return_true',
        ]);
    }
    public function like_post($request)
    {
        $post_id = $request->get_param('post_id');
        $like_count = get_post_meta($post_id, 'kg_like_count', true);
        $like_count = ($like_count == '') ? 0 : $like_count;
        $like_count++;
        update_post_meta($post_id, 'kg_like_count', $like_count);
        return rest_ensure_response($like_count);
    }
}
new KG_Like_Post();
