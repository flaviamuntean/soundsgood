const addPhoto = () => {
  const currentLocation = document.querySelector('.navigator');
  let form = document.getElementById("photo-form");
  const add = document.getElementById("add-photo");

  if(add){
    add.addEventListener("click", (event) => {
      console.log(form.style.display);
      if (form.style.display === "none") {
          form.style.display = "flex";
        } else {
          form.style.display = "none";
        }
    });
  }
}

export {addPhoto}
