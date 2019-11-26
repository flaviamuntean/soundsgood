const algoliaAutocomplete = () => {
  const algoliasearch = require('algoliasearch');
  // const autocomplete = require('autocomplete');

  const client = algoliasearch('plQ81NFPH4XJ', '2c960eb68c9a5830ac0180f605266550');
  const index = client.initIndex('SoundsGood');
  autocomplete('#search-input', { hint: true }, [
    {
      source: autocomplete.sources.hits(index, { hitsPerPage: 5 }),
      displayKey: 'my_attribute',
      templates: {
        suggestion: function(suggestion) {
          return suggestion._highlightResult.my_attribute.value;
        }
      }
    }
  ]).on('autocomplete:selected', function(event, suggestion, dataset, context) {
    console.log(event, suggestion, dataset, context);
  });
}

export {algoliaAutocomplete};

