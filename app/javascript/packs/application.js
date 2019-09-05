import "bootstrap";
const currentLocation = document.querySelector('.navigator');
currentLocation.addEventListener("click", (event) => {
  event.preventDefault();
  navigator.geolocation.getCurrentPosition((data) => {
    console.log(data);
    const latitude = data.coords.latitude;
    const longitude = data.coords.longitude;
  });
});
