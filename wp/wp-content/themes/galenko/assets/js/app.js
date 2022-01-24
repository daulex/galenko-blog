'use strict';

const siteFunctions = (function() {
	
	const testFunc = () => {
		console.log( 'Test init!' );
		const multiplyES6 = (x, y) => { return x * y; };
		console.log( multiplyES6 );
	};

	let publicFunctions = {};
	publicFunctions.init = function(options) {
		testFunc();
	};

	return publicFunctions;
})();

siteFunctions.init();