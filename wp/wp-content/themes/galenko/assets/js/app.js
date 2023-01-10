'use strict';

const siteFunctions = (function() {
	
	const readMore = () => {
		document.querySelectorAll('button.read-more').forEach((item) => {
      item.addEventListener('click', function(event) {
        event.preventDefault();
        event.currentTarget.parentNode.querySelector("h2 a").click();
      });

    });

	};

	let publicFunctions = {};
	publicFunctions.init = function(options) {
		readMore();
	};

	return publicFunctions;
})();

siteFunctions.init();