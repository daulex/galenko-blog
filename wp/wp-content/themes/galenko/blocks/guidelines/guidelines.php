<?php

/**
 * Guidelines Block Template.
 *
 * @param	 array $block The block settings and attributes.
 * @param	 string $content The block inner HTML (empty).
 * @param	 bool $is_preview True during AJAX preview.
 * @param	 (int|string) $post_id The post ID this block is saved to.
 */

if( isset( $block['data']['preview_image_help'] )	) :
	echo Awave_Gutenberg::get_preview_image( $block['data']['preview_image_help'], $block['name'] );
	return;
endif;

// Create id attribute allowing for custom 'anchor' value.
$id = 'guidelines-' . $block['id'];
if (!empty($block['anchor'])) :
	$id = $block['anchor'];
endif;

// Create class attribute allowing for custom 'className' and 'align' values.
$className = 'block guidelines';
if (!empty($block['className'])) :
	$className .= ' ' . $block['className'];
endif;
if (!empty($block['align'])) :
	$className .= ' align' . $block['align'];
endif;

$className = apply_filters( 'awave_block_class', $className, $block, $post_id );

// Load values and assing defaults.
$header = get_field('header');

?>
<section id="<?php echo esc_attr($id); ?>" class="<?php echo esc_attr($className); ?>">
	<div class="container editor-content">
		<h1>Header 1</h1>

		<p>
			Brödtext: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus consectetur tincidunt arcu accumsan pretium.
			Nullam aliquet augue in urna interdum, id vulputate risus vulputate. Sed dapibus elit in odio fringilla ornare.
			Curabitur vel mi accumsan, efficitur sapien vel, interdum tellus. Proin faucibus vulputate dolor.
			Nulla fringilla, lectus sed euismod cursus, ex urna consequat mauris, quis euismod diam felis non elit.
			Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
		</p>

		<h2>Header 2</h2>

		<p>
			Brödtext: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus consectetur tincidunt arcu accumsan pretium.
			Nullam aliquet augue in urna interdum, id vulputate risus vulputate. Sed dapibus elit in odio fringilla ornare.
			Curabitur vel mi accumsan, efficitur sapien vel, interdum tellus. Proin faucibus vulputate dolor.
			Nulla fringilla, lectus sed euismod cursus, ex urna consequat mauris, quis euismod diam felis non elit.
			Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
		</p>

		<h3>Header 3</h3>

		<p>
			Brödtext: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus consectetur tincidunt arcu accumsan pretium.
			Nullam aliquet augue in urna interdum, id vulputate risus vulputate. Sed dapibus elit in odio fringilla ornare.
			Curabitur vel mi accumsan, efficitur sapien vel, interdum tellus. Proin faucibus vulputate dolor.
			Nulla fringilla, lectus sed euismod cursus, ex urna consequat mauris, quis euismod diam felis non elit.
			Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
		</p>

		<p>
			<a href="#">Link</a>
		</p>

		<blockquote>
			Blockquote: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus consectetur tincidunt arcu accumsan pretium.
			Nullam aliquet augue in urna interdum, id vulputate risus vulputate. Sed dapibus elit in odio fringilla ornare.
			Curabitur vel mi accumsan, efficitur sapien vel, interdum tellus. Proin faucibus vulputate dolor.
			Nulla fringilla, lectus sed euismod cursus, ex urna consequat mauris, quis euismod diam felis non elit.
			Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
		</blockquote>

		<ul>
			<li>Lista 1</li>
			<li>Lista 2</li>
			<li>Lista 3</li>
		</ul>

		<p>
			Brödtext: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus consectetur tincidunt arcu accumsan pretium.
			Nullam aliquet augue in urna interdum, id vulputate risus vulputate. Sed dapibus elit in odio fringilla ornare.
			Curabitur vel mi accumsan, efficitur sapien vel, interdum tellus. Proin faucibus vulputate dolor.
			Nulla fringilla, lectus sed euismod cursus, ex urna consequat mauris, quis euismod diam felis non elit.
			Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
		</p>

		<ol>
			<li>Numerisk lista 1</li>
			<li>Numerisk lista 2</li>
			<li>Numerisk lista 3</li>
		</ol>

		<div class='gf_browser_gecko gform_wrapper gravity-theme' id='gform_wrapper_1'>
			<div class='gform_heading'>
				<h2 class="gform_title">Form elements - Gravity forms html structure</h2>
				<span class='gform_description'>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus consectetur tincidunt arcu accumsan pretium.</span>
			</div>
			<form method='post' enctype='multipart/form-data' id='gform_1' action='/?page_id=5' novalidate>
				<div class='gform_body gform-body'>
					<div id='gform_fields_1' class='gform_fields top_label form_sublabel_below description_below'>
						<div id="field_1_1" class="gfield field_sublabel_below field_description_below gfield_visibility_visible gform_text" data-field-class="gform_text" data-js-reload="field_1_1">
							<label class='gfield_label' for='input_1_1'>Textfield</label>
							<div class='ginput_container ginput_container_text'>
								<input name='input_1' id='input_1_1' type='text' value='' class='large' aria-invalid="false" />
							</div>
						</div>
						<div id="field_1_3" class="gfield field_sublabel_below field_description_below gfield_visibility_visible gform_text" data-field-class="gform_text" data-js-reload="field_1_3">
							<label class='gfield_label' for='input_1_3'>Textfield with error</label>
							<div class='ginput_container ginput_container_text'>
								<input name='input_3' id='input_1_3' type='text' value='' class='large' aria-invalid="false" />
							</div>
						</div>
						<div id="field_1_4" class="gfield field_sublabel_below field_description_below gfield_visibility_visible gform_email" data-field-class="gform_email" data-js-reload="field_1_4">
							<label class='gfield_label' for='input_1_4'>Email</label>
							<div class='ginput_container ginput_container_email'>
								<input name='input_4' id='input_1_4' type='email' value='' class='large' aria-invalid="false" />
							</div>
						</div>
						<div id="field_1_5" class="gfield field_sublabel_below field_description_below gfield_visibility_visible gform_textarea" data-field-class="gform_textarea" data-js-reload="field_1_5">
							<label class='gfield_label' for='input_1_5'>Textarea</label>
							<div class='ginput_container ginput_container_textarea'>
								<textarea name='input_5' id='input_1_5' class='textarea large' aria-invalid="false" rows='10' cols='50'></textarea>
							</div>
						</div>
						<fieldset id="field_1_6" class="gfield field_sublabel_below field_description_below gfield_visibility_visible gform_checkbox" data-field-class="gform_checkbox" data-js-reload="field_1_6">
							<legend class='gfield_label gfield_label_before_complex'>Checkboxes</legend>
							<div class='ginput_container ginput_container_checkbox'>
								<div class='gfield_checkbox' id='input_1_6'>
									<div class='gchoice gchoice_1_6_1'>
										<input class='gfield-choice-input' name='input_6.1' type='checkbox' value='First Choice' id='choice_1_6_1' />
										<label for='choice_1_6_1' id='label_1_6_1'>First Choice</label>
									</div>
									<div class='gchoice gchoice_1_6_2'>
										<input class='gfield-choice-input' name='input_6.2' type='checkbox' value='Second Choice' id='choice_1_6_2' />
										<label for='choice_1_6_2' id='label_1_6_2'>Second Choice</label>
									</div>
									<div class='gchoice gchoice_1_6_3'>
										<input class='gfield-choice-input' name='input_6.3' type='checkbox' value='Third Choice' id='choice_1_6_3' />
										<label for='choice_1_6_3' id='label_1_6_3'>Third Choice</label>
									</div>
								</div>
							</div>
						</fieldset>
						<fieldset id="field_1_7" class="gfield field_sublabel_below field_description_below gfield_visibility_visible gform_radio" data-field-class="gform_radio" data-js-reload="field_1_7">
							<legend class='gfield_label'>Radio buttons</legend>
							<div class='ginput_container ginput_container_radio'>
								<div class='gfield_radio' id='input_1_7'>
									<div class='gchoice gchoice_1_7_0'>
										<input class='gfield-choice-input' name='input_7' type='radio' value='First Choice' id='choice_1_7_0' onchange='gformToggleRadioOther( this )' />
										<label for='choice_1_7_0' id='label_1_7_0'>First Choice</label>
									</div>
									<div class='gchoice gchoice_1_7_1'>
										<input class='gfield-choice-input' name='input_7' type='radio' value='Second Choice' id='choice_1_7_1' onchange='gformToggleRadioOther( this )' />
										<label for='choice_1_7_1' id='label_1_7_1'>Second Choice</label>
									</div>
									<div class='gchoice gchoice_1_7_2'>
										<input class='gfield-choice-input' name='input_7' type='radio' value='Third Choice' id='choice_1_7_2' onchange='gformToggleRadioOther( this )' />
										<label for='choice_1_7_2' id='label_1_7_2'>Third Choice</label>
									</div>
								</div>
							</div>
						</fieldset>
						<div id="field_1_8" class="gfield field_sublabel_below field_description_below gfield_visibility_visible gform_select" data-field-class="gform_select" data-js-reload="field_1_8">
							<label class='gfield_label' for='input_1_8'>Select</label>
							<div class='ginput_container ginput_container_select'>
								<select name='input_8' id='input_1_8' class='large gfield_select' aria-invalid="false">
									<option value='First Choice'>First Choice</option>
									<option value='Second Choice'>Second Choice</option>
									<option value='Third Choice'>Third Choice</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class='gform_footer top_label'>
					<button class='btn btn--primary' id='gform_submit_button_1'>
						<span>Submit</span>
					</button>
					<input type='hidden' class='gform_hidden' name='is_submit_1' value='1' />
					<input type='hidden' class='gform_hidden' name='gform_submit' value='1' />
					<input type='hidden' class='gform_hidden' name='gform_unique_id' value='' />
					<input type='hidden' class='gform_hidden' name='state_1' value='WyJ7XCI3XCI6W1wiYTMyMGY0OTE4MDhkOTA0NzgyOWI1NGJiYmY1YjY4NWZcIixcIjEyNGYxYjYwYjQ0MmQzNWU5ZWI3YmE3ODUxYWU3NjhkXCIsXCIzMjEyZDJmNjIwNjRhNDRiZjNlZWZmYTcyYWE4OTBhMVwiXX0iLCIwYzQ1OTViZmU5ZjU4YTg4MTVlMDM2MjJlMTBjZjQ3OSJd' />
					<input type='hidden' class='gform_hidden' name='gform_target_page_number_1' id='gform_target_page_number_1' value='0' />
					<input type='hidden' class='gform_hidden' name='gform_source_page_number_1' id='gform_source_page_number_1' value='1' />
					<input type='hidden' name='gform_field_values' value='' />
				</div>
			</form>
		</div>
	</div>
</section>