const toggleIcons = function() {
  const icon = document.querySelector('.banner .fa-heart')
  if(icon) {
    console.log(icon)


    const toggleIcon = function(icon) {
      icon.classList.toggle('far');
      icon.classList.toggle('fas');
    }

    const profile = icon.closest('.icondiv')
    const profileId = profile.id

    icon.addEventListener('click', () => {
      if (icon.classList.contains('far')) {
        // fetch('/favorite_users', {
        //   method: 'post',
        //   body: JSON.stringify({user_id: profileId}),
        //   headers: {
        //     'Content-Type': 'application/json',
        //     'X-CSRF-Token': Rails.csrfToken()
        //   },
        //   credentials: 'same-origin'
        // }).then(() => toggleIcon(icon))
        toggleIcon(icon);


      } else if (icon.classList.contains('fas')) {
        // fetch(`/favorite_users/${profileId}`, {
        //   method: 'delete',
        //   body: JSON.stringify({user_id: profileId}),
        //   headers: {
        //     'Content-Type': 'application/json',
        //     'X-CSRF-Token': Rails.csrfToken()
        //   },
        //   credentials: 'same-origin'
        // }).then(() => toggleIcon(icon))
        toggleIcon(icon);
      }
    })
  }
};

export { toggleIcons };
