<!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="profile" href="http://gmpg.org/xfn/11">
	<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">
	<?php wp_head(); ?>
</head>
<body <?php body_class(); ?>>

	<?php wp_body_open(); ?>
    <?php require_once('inc/icons.php'); ?>
	<?php get_template_part( 'templates/nav' );  ?>