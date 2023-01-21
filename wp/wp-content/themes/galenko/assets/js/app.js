'use strict';

const siteFunctions = (function() {

  const contactToggle = () => {
    document.querySelectorAll('.contact-toggle a').forEach((item) => {
      item.addEventListener('click', function(event) {
        event.preventDefault();
        document.body.classList.toggle('contact-is-open');
      });
    });
  };
	
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
    contactToggle();
	};

	return publicFunctions;
})();

siteFunctions.init();