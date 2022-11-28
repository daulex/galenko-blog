<?php
/**
 * Writing to the debug.log file, located under wp-content/.
 * Can write both strings as well as arrays and objects.
 * Requires constant WP_DEBUG_LOG to be set to true in wp-config.
 */
if ( ! function_exists('write_log')) {
	function write_log ( $log )  {
	   if ( is_array( $log ) || is_object( $log ) ) {
		  error_log( print_r( $log, true ) );
	   } else {
		  error_log( $log );
	   }
	}
}

/**
 * Echo your code right on the page.
 */
if ( ! function_exists('awave_debug')) {
	function awave_debug( $var ) {
		echo '<pre>';
		print_r($var);
		echo '</pre>';
	}
}