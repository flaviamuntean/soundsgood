const getAddress = () => {
  const input = document.querySelector('#user_address');
  if (input) {
    const places = require('places.js')
    const placesAutocomplete = places({
      appId: 'plQ81NFPH4XJ',
      apiKey: '2c960eb68c9a5830ac0180f605266550',
      container: document.querySelector('#user_address')
    });
  }
}

export {getAddress};

