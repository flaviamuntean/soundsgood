const addPhoto = () => {
  console.log("hello addPhoto");
  const currentLocation = document.querySelector('.navigator');
  let form = document.getElementById("photo-form");
  const add = document.getElementById("add-photo");
  if(add){
    add.addEventListener("click", (event) => {
      if (form.style.visibility === "hidden") {
          form.style.visibility = "visible";
        } else {
          form.style.visibility = "hidden";
        }
    });
  }
}

export {addPhoto}
