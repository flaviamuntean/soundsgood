const initGeoLocation = () => {
  const currentLocation = document.querySelector('.navigator');
  if(currentLocation) {
    currentLocation.addEventListener("click", (event) => {
      event.preventDefault();
      navigator.geolocation.getCurrentPosition((data) => {
        console.log(data);
        const lat = document.getElementById('latitude');
        const long = document.getElementById('longitude');
        const submit = document.getElementById('submit-geo');
        lat.value = data.coords.latitude;
        long.value = data.coords.longitude;
        submit.click();
      });
    });
  }
}

export {initGeoLocation};


