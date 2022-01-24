'use strict';

(function () {

	const testFunc = () => {
		const blocks = [...document.querySelectorAll('.guidelines')];
		if( blocks ) {
			blocks.forEach( (block) => {
				block.addEventListener('click', (event) => {
					console.log(block);
				});
			});
		}
	};

	// Init function
	testFunc();

	// Init function for admin
	if( window.acf ) {
        window.acf.addAction( 'render_block_preview/type=guidelines', testFunc );
    }

})();