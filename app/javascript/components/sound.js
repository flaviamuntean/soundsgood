const playSound = () => {
  play_button = document.getElementById('play-soundcloud')
  soundcloud = document.querySelector('.playButton medium')
    play_button.addEventListener("click", (event) => {
      soundcloud.click()
  });
}

export {playSound}
