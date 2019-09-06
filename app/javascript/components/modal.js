const submitAll = () => {
  const submitModal = document.querySelector('.done-modal');
  if(submitModal) {
    submitModal.addEventListener("click", (event) => {
      event.preventDefault()
      const bio = document.getElementById('submit-bio-update');
      const instrument = document.getElementById('submit-instrument-update');
      const genre = document.getElementById('submit-genre-update');
      const photo = document.getElementById('submit-photo-update');
      bio.click();
      instrument.click();
      genre.click();
      photo.click();
    });
  }
}

export {submitAll};
