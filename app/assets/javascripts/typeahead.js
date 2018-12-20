const poems = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.whitespace,
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote: {
    url: '/poems/autocomplete?query=%QUERY',
    wildcard: '%QUERY'
  }
});

$('#query').typeahead({
  hint: true,
  highlight: true,
  minLength: 1
},
{
  source: poems
});

$('#query').typeahead().on('typeahead:selected', function(e) {
  e.target.form.submit();
});
