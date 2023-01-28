<?php

/**
 * Theme specific functions.
 */
class galenko_Custom_Functions {

	/**
	 * Retrieves a list of share links for a post.
	 *
	 * @param int|WP_Post $post Post ID or post object.
	 * @return string     A ul list with share links.
	 */
	public function share_post( $post )
	{
		$output = '';

		$post = get_post( $post );
		$url = urlencode( get_permalink( $post ) );
		$title = str_replace( ' ', '%20', get_the_title( $post ) );

		$twitterURL  = 'https://twitter.com/intent/tweet?text=' . $title . '&amp;url=' . $url . '&amp;via=WhistleB';
		$facebookURL = 'https://www.facebook.com/sharer/sharer.php?u=' . $url;
		$linkedInURL = 'https://www.linkedin.com/shareArticle?mini=true&url=' . $url . '&amp;title=' . $url;

		$output .= '<ul class="social-share">';
			$output .= '<li><span>'.__('Share article:', 'awave').'</span></li>';
			$output .= '<li><a href="' . $twitterURL . '" target="_blank">Twitter</a></li>';
			$output .= '<li><a href="' . $linkedInURL . '" target="_blank">LinkedIn</a></li>';
			$output .= '<li><a href="' . $facebookURL . '" target="_blank">Facebook</a></li>';
		$output .= '</ul>';

		return $output;
	}
  public function kg_icons($icon){
    return '<svg class="icon icon-'.$icon.'"><use xlink:href="#icon-'.$icon.'"></use></svg>';
  }
  public function get_time_ago($time_stamp)
  {
      $time_difference = strtotime('now') - $time_stamp;

      if ($time_difference >= 60 * 60 * 24 * 365.242199)
      {
          /*
          * 60 seconds/minute * 60 minutes/hour * 24 hours/day * 365.242199 days/year
          * This means that the time difference is 1 year or more
          */
          return $this->get_time_ago_string($time_stamp, 60 * 60 * 24 * 365.242199, 'year');
      }
      elseif ($time_difference >= 60 * 60 * 24 * 30.4368499)
      {
          /*
          * 60 seconds/minute * 60 minutes/hour * 24 hours/day * 30.4368499 days/month
          * This means that the time difference is 1 month or more
          */
          return $this->get_time_ago_string($time_stamp, 60 * 60 * 24 * 30.4368499, 'month');
      }
      elseif ($time_difference >= 60 * 60 * 24 * 7)
      {
          /*
          * 60 seconds/minute * 60 minutes/hour * 24 hours/day * 7 days/week
          * This means that the time difference is 1 week or more
          */
          return $this->get_time_ago_string($time_stamp, 60 * 60 * 24 * 7, 'week');
      }
      elseif ($time_difference >= 60 * 60 * 24)
      {
          /*
          * 60 seconds/minute * 60 minutes/hour * 24 hours/day
          * This means that the time difference is 1 day or more
          */
          return $this->get_time_ago_string($time_stamp, 60 * 60 * 24, 'day');
      }
      elseif ($time_difference >= 60 * 60)
      {
          /*
          * 60 seconds/minute * 60 minutes/hour
          * This means that the time difference is 1 hour or more
          */
          return $this->get_time_ago_string($time_stamp, 60 * 60, 'hour');
      }
      else
      {
          /*
          * 60 seconds/minute
          * This means that the time difference is a matter of minutes
          */
          return $this->get_time_ago_string($time_stamp, 60, 'minute');
      }
  }

  public function get_time_ago_string($time_stamp, $divisor, $time_unit)
  {
      $time_difference = strtotime("now") - $time_stamp;
      $time_units      = floor($time_difference / $divisor);

      settype($time_units, 'string');

      if ($time_units === '0')
      {
          return 'less than 1 ' . $time_unit . ' ago';
      }
      elseif ($time_units === '1')
      {
          return '1 ' . $time_unit . ' ago';
      }
      else
      {
          /*
          * More than "1" $time_unit. This is the "plural" message.
          */
          // TODO: This pluralizes the time unit, which is done by adding "s" at the end; this will not work for i18n!
          return $time_units . ' ' . $time_unit . 's ago';
      }
  }
  /**
   * KG Like button
   */
    public function kg_like_button($post_id){
        $like_count = get_post_meta($post_id, 'kg_like_count', true);
        $like_count = ($like_count == '') ? 0 : $like_count;
        
        
        $like_button = '<a href="#" class="like-button" data-post-id="'.$post_id.'">';
        $like_button .= '<svg class="icon icon-heart"><use xlink:href="#icon-heart"></use></svg>';
        $like_button .= '<svg class="icon icon-heart-solid"><use xlink:href="#icon-heart-solid"></use></svg>';
        
        $like_button .= '<span class="like-count">'.$like_count.'</span>';
        $like_button .= '</a>';
        return $like_button;
    }
}