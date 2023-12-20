<?php
/**
 * Custom WordPress REST endpoint to record a page view
 * Takes in json post:
 * {
 *    page_title: pageTitle,
 *    url: url,
 *    id: postID
 *  }
 * Returns 200 status code on success
 */


class KG_Page_View extends WP_REST_Controller{
    public function __construct(){
        add_action('rest_api_init', [$this, 'register_routes']);
    }
    public function register_routes(){
        register_rest_route('kg/v1', '/pageview', [
            'methods' => 'POST',
            'callback' => [$this, 'page_view'],
            'permission_callback' => '__return_true',
        ]);
        register_rest_route('kg/v1', '/pageview', [
            'methods' => 'GET',
            'callback' => [$this, 'get_page_view_count'],
            'permission_callback' => '__return_true',
        ]);
    }
    public function page_view($request){
        $page_title = $request->get_param('page_title');
        $url = $request->get_param('url');
        $id = $request->get_param('id');
        $page_view_count = get_post_meta($id, 'kg_page_view_count', true);
        $page_view_count = ($page_view_count == '') ? 0 : $page_view_count;
        $page_view_count++;
        update_post_meta($id, 'kg_page_view_count', $page_view_count);
        return rest_ensure_response($page_view_count);
    }

    // add endpoint to get page view count for all pages
    public function get_page_view_count($request){
        $args = [
            'post_type' => 'post',
            'posts_per_page' => -1,
            'meta_key' => 'kg_page_view_count',
            'orderby' => 'meta_value_num',
            'order' => 'DESC',
        ];
        $query = new WP_Query($args);
        $posts = $query->posts;
        $data = [];
        foreach($posts as $post){
            $data[] = [
                'id' => $post->ID,
                'title' => $post->post_title,
                'count' => get_post_meta($post->ID, 'kg_page_view_count', true),
            ];
        }
        return rest_ensure_response($data);
    }
}
new KG_Page_View();

