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
        event.currentTarget.parentNode.parentNode.querySelector("h2 a").click();
      });

    });

	};

    const like = () => {
        document.querySelectorAll('a.like-button').forEach((item) => {
            // check if user has liked this post
            const postId = item.dataset.postId;
            const cookie = document.cookie.split(';').find((cookie) => {
                return cookie.trim().startsWith(`liked_${postId}`);
            });
            if (cookie) {
                item.classList.add('liked');
            }
            // add event listener to like button
            item.addEventListener('click', function(event) {
                event.preventDefault();
                if(!event.currentTarget.classList.contains('liked')){
                    event.currentTarget.classList.add('liked');
                    const likeCount = event.currentTarget.querySelector('span.like-count');
                    const likeCountValue = parseInt(likeCount.innerHTML);
                    likeCount.innerHTML = likeCountValue + 1;
                    const postId = event.currentTarget.dataset.postId;
                    // send ajax post request to /wp-json/kg/v1/like with postId as post_id
                    fetch('/wp-json/kg/v1/like', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({
                            post_id: postId
                        })
                    }).then((response) => {
                        return response.json();
                    }
                    ).then((data) => {
                        console.log(data);
                    }
                    ).catch((error) => {
                        console.log(error);
                    }
                    );
                    // set cookie to remember that user has liked this post
                    document.cookie = `liked_${postId}=true; max-age=31536000; path=/`;

                }
                // 
                // 
                // if (!event.currentTarget.classList.contains('liked')) {
                //     
                //     
                //     console.log(postId);
                //     
                // }
                

            });
        });
    };

	let publicFunctions = {};
	publicFunctions.init = function(options) {
		readMore();
        contactToggle();
        like();
	};

	return publicFunctions;
})();

siteFunctions.init();