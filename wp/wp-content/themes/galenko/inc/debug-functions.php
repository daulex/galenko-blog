<?php

// use write_log( $var ) to write to log
if ( ! function_exists('write_log')) {
	function write_log ( $log )  {
	   if ( is_array( $log ) || is_object( $log ) ) {
		  error_log( print_r( $log, true ) );
	   } else {
		  error_log( $log );
	   }
	}
}

// Debugging
if ( ! function_exists('awave_debug')) {
	function awave_debug( $var ) {
		echo '<pre>';
		print_r($var);
		echo '</pre>';
	}
}