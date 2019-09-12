const toggleIcons = function() {
  const icon = document.querySelector('.banner .fa-heart')
  if(icon) {
    console.log(icon)

    const toggleIcon = function(icon) {
      icon.classList.toggle('far');
      icon.classList.toggle('fas');
    }

    icon.addEventListener('click', () => {
      if (icon.classList.contains('far')) {
        toggleIcon(icon);
      } else if (icon.classList.contains('fas')) {
        toggleIcon(icon);
      }
    })
  }
};

export { toggleIcons };
