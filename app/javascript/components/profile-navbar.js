const initUpdateNavbarOnScroll = () => {
  const header = document.getElementById('myHeader');
  if (header) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        header.classList.add('sticky');
      } else {
        header.classList.remove('sticky');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
