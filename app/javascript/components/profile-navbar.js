
// When the user scrolls the page, execute myFunction
window.onscroll = function() {myFunction()};

// Get the header
var header = document.getElementById("myHeader");

// Get the offset position of the navbar
var sticky = header.offsetTop;

// Add the sticky class to the header when you reach its scroll position. Remove "sticky" when you leave the scroll position
function myFunction() {
  if (window.pageYOffset > sticky) {
    header.classList.add("sticky");
  } else {
    header.classList.remove("sticky");
  }
}



// const navBar = () => {
//   const video = document.getElementById("video-btn");
//   const audio = document.getElementById("audio-btn");
//   const bio = document.getElementById("bio-btn");
//   const influences = document.getElementById("influences-btn");
//   video.addEventListener("click", (event) => {
//     event.preventDefault();
//     video.classList.add('active')
//     if (audio.classList.contains("active")) {
//       audio.classList.remove('active');
//     }
//     if (bio.classList.contains("active")) {
//       bio.classList.remove('active');
//     }
//     if (influences.classList.contains("active")) {
//       influences.classList.remove('active');
//     }
//   });
//   audio.addEventListener("click", (event) => {
//     if (video.classList.contains("active")) {
//       video.classList.remove('active');
//     }
//     audio.classList.add('active')
//     if (bio.classList.contains("active")) {
//       bio.classList.remove('active');
//     }
//     if (influences.classList.contains("active")) {
//       influences.classList.remove('active');
//     }
//   });
//   bio.addEventListener("click", (event) => {
//     if (video.classList.contains("active")) {
//       video.classList.remove('active');
//     }
//     if (audio.classList.contains("active")) {
//       audio.classList.remove('active');
//     }
//     bio.classList.add('active')
//     if (influences.classList.contains("active")) {
//       influences.classList.remove('active');
//     }
//   });
//   influences.addEventListener("click", (event) => {
//     if (video.classList.contains("active")) {
//       video.classList.remove('active');
//     }
//     if (audio.classList.contains("active")) {
//       audio.classList.remove('active');
//     }
//     if (bio.classList.contains("active")) {
//       bio.classList.remove('active');
//     }
//     influences.classList.add('active')
//   });
//  }

 export {myFunction}

